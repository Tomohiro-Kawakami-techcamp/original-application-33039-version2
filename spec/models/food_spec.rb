require 'rails_helper'

RSpec.describe Food, type: :model do
  describe '#create' do
    before do
      @food = FactoryBot.build(:food)
    end

    it "全て記入すれば登録できること" do
      expect(@food).to be_valid
    end

    it "imageが空では登録できないこと" do
      @food.image = nil
      @food.valid?
      expect(@food.errors.full_messages).to include("Image can't be blank")
    end

    it "nameが空では登録できないこと" do
      @food.name = nil
      @food.valid?
      expect(@food.errors.full_messages).to include("Name can't be blank")
    end

    it "priceが空では登録できないこと" do
      @food.price = nil
      @food.valid?
      expect(@food.errors.full_messages).to include("Price can't be blank")
    end

    it "priceが全角数字であれば登録できないこと" do
      @food.price = "５００００"
      @food.valid?
      expect(@food.errors.full_messages).to include("Price Half-width number")
    end

    it "priceが数字以外であれば登録できないこと" do
      @food.price = "abc"
      @food.valid?
      expect(@food.errors.full_messages).to include("Price Half-width number")
    end

    it "priceが半角英数混合では登録できないこと" do
      @food.price = "10000ab"
      @food.valid?
      expect(@food.errors.full_messages).to include("Price Half-width number")
    end
  end
end