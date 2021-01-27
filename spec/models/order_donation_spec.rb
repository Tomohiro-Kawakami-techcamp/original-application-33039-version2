require 'rails_helper'

RSpec.describe OrderDonation, type: :model do
  describe '#create' do
    before do
      @order_donation = FactoryBot.build(:order_donation)
    end

    it "全て記入すれば購入できること" do
      expect(@order_donation).to be_valid
    end

    it "建物以外全て記入すれば購入できること" do
      @order_donation.building = nil
      expect(@order_donation).to be_valid
    end

    it "郵便番号が空では購入できないこと" do
      @order_donation.postal_code = nil
      @order_donation.valid?
      expect(@order_donation.errors.full_messages).to include("Postal code can't be blank")
    end

    it "郵便番号にハイフンがないと購入できないこと" do
      @order_donation.postal_code = "1234567"
      @order_donation.valid?
      expect(@order_donation.errors.full_messages).to include("Postal code input correctly")
    end

    it "都道府県の選択がない場合購入できないこと" do
      @order_donation.prefecture_id = 0
      @order_donation.valid?
      expect(@order_donation.errors.full_messages).to include("Prefecture Select")
    end

    it "電話番号が空では購入できないこと" do
      @order_donation.phone_number = nil
      @order_donation.valid?
      expect(@order_donation.errors.full_messages).to include("Phone number can't be blank")
    end

    it "電話番号にハイフンがあると購入できないこと" do
      @order_donation.phone_number = "090-1234-5678"
      @order_donation.valid?
      expect(@order_donation.errors.full_messages).to include("Phone number is Half-width number")
    end

    it "電話番号が12桁以上だと購入できないこと" do
      @order_donation.phone_number = "090123456789"
      @order_donation.valid?
      expect(@order_donation.errors.full_messages).to include("Phone number is less than 11 number characters")
    end

    it "個数が空だと購入できないこと" do
      @order_donation.quantity = nil
      @order_donation.valid?
      expect(@order_donation.errors.full_messages).to include("Quantity can't be blank")
    end

    it "時間が空だと購入できないこと" do
      @order_donation.time = nil
      @order_donation.valid?
      expect(@order_donation.errors.full_messages).to include("Time can't be blank")
    end

    it "時間の入力を間違えると購入できないこと" do
      @order_donation.time = "12/12"
      @order_donation.valid?
      expect(@order_donation.errors.full_messages).to include("Time input correctly")
    end

    it "user_idが空だと購入できないこと" do
      @order_donation.user_id = nil
      @order_donation.valid?
      expect(@order_donation.errors.full_messages).to include("User can't be blank")
    end

    it "food_idが空だと購入できないこと" do
      @order_donation.food_id = nil
      @order_donation.valid?
      expect(@order_donation.errors.full_messages).to include("Food can't be blank")
    end
  end
end