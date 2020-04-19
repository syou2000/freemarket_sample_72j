class CardsController < ApplicationController

  require "payjp"
  before_action :set_card

  def new 
    @side = ["マイページ","お知らせ","やることリスト","いいね！一覧","出品する","下書き一覧","出品した商品-出品中","出品した商品-取引中","出品した商品-売却済み","購入した商品-取引中","購入した商品-過去の取引","ニュース一覧","評価一覧","ガイド","お問い合わせ"]
    @side1 = ["売上・振込申請","ポイント"]
    @side2 = ["プロフィール","発送元・お届け先住所変更","メール/パスワード","本人情報","電話番号の確認"]
    card = Card.where(user_id: current_user.id).first
    redirect_to action: "index" if card.present?
  end



  def pay 
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]

    if params['payjp-token'].blank?
      redirect_to action: "new"
    else

      customer = Payjp::Customer.create(
        description: 'test', 
        email: current_user.email,
        card: params['payjp-token'],
        metadata: {user_id: current_user.id} 
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "index"
      else
        redirect_to action: "create"
      end
    end
  end

  def index 
    @side = ["マイページ","お知らせ","やることリスト","いいね！一覧","出品する","下書き一覧","出品した商品-出品中","出品した商品-取引中","出品した商品-売却済み","購入した商品-取引中","購入した商品-過去の取引","ニュース一覧","評価一覧","ガイド","お問い合わせ"]
    @side1 = ["売上・振込申請","ポイント"]
    @side2 = ["プロフィール","発送元・お届け先住所変更","メール/パスワード","本人情報","電話番号の確認"]
    if @card.present?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def destroy 
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.delete
    if @card.destroy 
      redirect_to action: "index", notice: "削除しました"
    else 
      redirect_to action: "index", alert: "削除できませんでした"
    end
  end


  private

  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end
end
