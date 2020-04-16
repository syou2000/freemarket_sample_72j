class CardsController < ApplicationController

  require "payjp"
  before_action :set_card

  def new
    card = Card.where(user_id: current_user.id)
    redirect_to action: "show" if card.exists?
    @side = ["マイページ","お知らせ","やることリスト","いいね！一覧","出品する","下書き一覧","出品した商品-出品中","出品した商品-取引中","出品した商品-売却済み","購入した商品-取引中","購入した商品-過去の取引","ニュース一覧","評価一覧","ガイド","お問い合わせ"]
    @side1 = ["売上・振込申請","ポイント"]
    @side2 = ["プロフィール","発送元・お届け先住所変更","メール/パスワード","本人情報","電話番号の確認"]
  end

  def create #PayjpとCardのデータベースを作成
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]

    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      # トークンが正常に発行されていたら、顧客情報をPAY.JPに登録します。
      customer = Payjp::Customer.create(
        description: 'test', # 無くてもOK。PAY.JPの顧客情報に表示する概要です。
        email: current_user.email,
        card: params['payjp-token'], # 直前のnewアクションで発行され、送られてくるトークンをここで顧客に紐付けて永久保存します。
        metadata: {user_id: current_user.id} # 無くてもOK。
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to "index"
      else
        redirect_to action: "create"
      end
    end
  end

  def destroy #PayjpとCardデータベースを削除します
    card = Card.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end

  def show
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  private

  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end
end
