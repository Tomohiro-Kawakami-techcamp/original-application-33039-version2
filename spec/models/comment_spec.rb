require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#create' do
    before do
      @comment = FactoryBot.build(:comment)
    end

    it "全て記入すれば投稿できること" do
      expect(@comment).to be_valid
    end

    it "nicknameが空では投稿できないこと" do
      @comment.nickname = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include("Nickname can't be blank")
    end

    it "messageが空では投稿できないこと" do
      @comment.message = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include("Message can't be blank")
    end
  end
end