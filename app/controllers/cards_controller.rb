class CardsController < ApplicationController

  require "payjp"

  def new
    card = Card.where(user_id: current_user.id)
    redirect_to action: "show" if card.exists?
    @side = ["マイページ","お知らせ","やることリスト","いいね！一覧","出品する","下書き一覧","出品した商品-出品中","出品した商品-取引中","出品した商品-売却済み","購入した商品-取引中","購入した商品-過去の取引","ニュース一覧","評価一覧","ガイド","お問い合わせ"]
    @side1 = ["売上・振込申請","ポイント"]
    @side2 = ["プロフィール","発送元・お届け先住所変更","メール/パスワード","本人情報","電話番号の確認"]
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
end
