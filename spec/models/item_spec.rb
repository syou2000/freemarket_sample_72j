require 'rails_helper'

describe Item do
  describe '#create' do

    it "nameとprice,explain,postage,prefecture_id,shipping_date,category,item_statusが存在すれば登録できること" do
      item = build(:item)
      expect(item).to be_valid
    end

    it "nameがない場合は登録できないこと" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end


    it "priceがない場合は登録できないこと" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end
    
    it "explainがない場合は登録できないこと" do
      item = build(:item, explain: nil)
      item.valid?
      expect(item.errors[:explain]).to include("can't be blank")
    end

    it "postageがない場合は登録できないこと" do
      item = build(:item, postage: nil)
      item.valid?
      expect(item.errors[:postage]).to include("can't be blank")
    end

    it "prefecture_idがない場合は登録できないこと" do
      item = build(:item, prefecture_id: nil)
      item.valid?
      expect(item.errors[:prefecture_id]).to include("can't be blank")
    end

    it "shipping_dateがない場合は登録できないこと" do
      item = build(:item, shipping_date: nil)
      item.valid?
      expect(item.errors[:shipping_date]).to include("can't be blank")
    end

    it "categoryがない場合は登録できないこと" do
      item = build(:item, category: nil)
      item.valid?
      expect(item.errors[:category]).to include("can't be blank")
    end

    it "item_statusがない場合は登録できないこと" do
      item = build(:item, item_status: nil)
      item.valid?
      expect(item.errors[:item_status]).to include("can't be blank")
    end

    it " priceが10000000以上であれば登録できないこと" do
      item = build(:item, price: "10000000")
      item.valid?
      expect(item.errors[:price]).to include("must be less than or equal to 9999999")
    end

    it "priceが9999999以下では登録できること " do
      item = build(:item, price: "9999999")
      expect(item).to be_valid
    end

    it " priceが299以下であれば登録できないこと" do
      item = build(:item, price: "299")
      item.valid?
      expect(item.errors[:price]).to include("must be greater than or equal to 300")
    end

    it "priceが300以上では登録できること " do
      item = build(:item, price: "300")
      expect(item).to be_valid
    end

  end
end