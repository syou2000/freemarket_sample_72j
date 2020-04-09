require 'rails_helper'

describe User do
  describe '#create' do

    it "nicknameとemail、password、password_confirmation、first_name、last_name、first_name_kana、last_name_kana、year、month、dayが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it " nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "first_nameがない場合は登録できないこと" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it "last_nameがない場合は登録できないこと" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    it "first_name_kanaがない場合は登録できないこと" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end

    it "last_name_kanaがない場合は登録できないこと" do
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("can't be blank")
    end

    it "yearがない場合は登録できないこと" do
      user = build(:user, year: nil)
      user.valid?
      expect(user.errors[:year]).to include("can't be blank")
    end

    it "monthがない場合は登録できないこと" do
      user = build(:user, month: nil)
      user.valid?
      expect(user.errors[:month]).to include("can't be blank")
    end

    it "dayがない場合は登録できないこと" do
      user = build(:user, day: nil)
      user.valid?
      expect(user.errors[:day]).to include("can't be blank")
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "emailに@がなければ登録できないこと" do
      user = build(:user, email: "aaaaaaa")
      user.valid?
      expect(user.errors[:email]).to include("is invalid", "is invalid")
    end

    it "emailに@の後に文字がなければ登録できないこと" do
      user = build(:user, email: "aaaaaaa@")
      user.valid?
      expect(user.errors[:email]).to include("is invalid", "is invalid")
    end


    it " 重複したemailが存在する場合は登録できないこと " do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank", "can't be blank", "is too short (minimum is 7 characters)", "is invalid")
    end

    it "passwordが6文字以下では登録できないこと" do
      user = build(:user, password: "11111a", password_confirmation: "11111a")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 7 characters)", "is invalid")
    end

    it "passwordに数字のみでは登録できないこと " do
      user = build(:user, password: "1111111", password_confirmation: "1111111")
      user.valid?
      expect(user.errors[:password]).to include("is invalid")
    end

    it "passwordに英字のみでは登録できないこと " do
      user = build(:user, password: "aaaaaaa", password_confirmation: "aaaaaaa")
      user.valid?
      expect(user.errors[:password]).to include("is invalid")
    end

    it "passwordが7文字以上かつ英数字が１文字以上含まれていれば登録できること" do
      user = build(:user, password: "111111a", password_confirmation: "111111a")
      expect(user).to be_valid
    end

    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

  end
end
