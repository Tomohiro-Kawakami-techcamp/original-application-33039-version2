require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#create' do
    before do
      @comment = FactoryBot.build(:comment)
    end

    it "メッセージ、ニックネームを書けば投稿できること" do
      expect(@comment).to be_valid
    end

    it "ニックネームが空ではやり取りできないこと" do
      @comment.nickname = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include("Nickname can't be blank")
    end

    it "メッセージが空ではやり取りできないこと" do
      @comment.message = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include("Message can't be blank")
    end
  end
end