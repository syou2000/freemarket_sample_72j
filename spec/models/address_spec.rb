require 'rails_helper'

describe Address do
# RSpec.describe Address, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe '#create' do
    #1
    it "last_name, first_name, last_name_hurigana, first_name_hurigana, zip_code, prefecture_id, city, house_number, building, phone_number, userが存在すれば登録できる" do
      address = build(:address)
      expect(address).to be_valid
    end

    #2
    it "last_nameがない場合は登録できない" do
      address = build(:address, last_name: nil)
      expect(address).to be_valid
    end

    #3
    it "first_nameがない場合は登録できない" do
      address = build(:address, first_name: nil)
      expect(address).to be_valid
    end

    #4
    it "last_name_huriganaがない場合は登録できない" do
      address = build(:address, last_name_hurigana: nil)
      expect(address).to be_valid
    end

    #5
    it "first_name_huriganaがない場合は登録できない" do
      address = build(:address, first_name_hurigana: nil)
      expect(address).to be_valid
    end

    #6
    it "zip_codeがない場合は登録できない" do
      address = build(:address, zip_code: nil)
      address.valid?
      # binding.pry
      # expect(address).to be_valid
      expect(address.errors[:zip_code]).to include("can't be blank")
    end

    #7
    it "prefecture_idがない場合は登録できない" do
      address = build(:address, prefecture_id: nil)
      expect(address).to be_valid
    end

    #8
    it "cityがない場合は登録できない" do
      address = build(:address, city: nil)
      expect(address).to be_valid
    end

    #9
    it "house_numberがない場合は登録できない" do
      address = build(:address, house_number: nil)
      expect(address).to be_valid
    end

    #  #10
     it " 重複したphone_numberが存在する場合は登録できないこと " do
      address = create(:address)
      another_address = build(:address, phone_number: address.phone_number)
      another_address.valid?
      expect(another_address.errors[:phone_number]).to include("has already been taken")
    end

  end

end
