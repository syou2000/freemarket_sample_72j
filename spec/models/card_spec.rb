require 'rails_helper'

RSpec.describe Card, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "customer_idとcard_idが存在すれば登録できること" do
    card = build(:card)
    expect(card).to be_valid
  end

  it "customer_idがない場合は登録できないこと" do
    card = build(:card, customer_id: nil)
    card.valid?
    expect(card.errors[:customer_id]).to include("can't be blank")
  end

  # it "user_idがない場合は登録できないこと" do
  #   card = build(:card, user_id: nil)
  #   card.valid?
  #   expect(card.errors[:user_id]).to include("can't be blank")
  # end

  it "customer_idがない場合は登録できないこと" do
    card = build(:card, card_id: nil)
    card.valid?
    expect(card.errors[:card_id]).to include("can't be blank")
  end
end
