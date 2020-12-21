require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '通院記録の保存' do
    context "通院記録が保存できる場合" do
      it "全ての項目があれば保存される" do
        expect(@post).to be_valid
      end

      it "メモが空でも保存される" do
        @post.memo = nil
        expect(@post).to be_valid
      end
    end

    context "通院記録が保存できない場合" do
      it "日付がないと保存できない" do
        @post.start_time = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Start time can't be blank")
      end

      it "タイトルがないと保存できない" do
        @post.title = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Title can't be blank")
      end

      it "理由がないと保存できない" do
        @post.reason = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Reason can't be blank")
      end

      it "ユーザーが紐付いていないと保存できない" do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("User must exist")
      end

      it "カテゴリが紐付いていないと保存できない" do
        @post.category = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Category must exist")
      end
    end
  end
end
