require 'rails_helper'

RSpec.describe Medicine, type: :model do
  before do
    @medicine = FactoryBot.build(:medicine)
  end

  describe '処方管理の登録' do
    context "処方管理が登録できる場合" do
      it "全ての項目があれば保存される" do
        expect(@medicine).to be_valid
      end

      it "メモが空でも保存される" do
        @medicine.memo = nil
        expect(@medicine).to be_valid
      end

      it "画像が空でも保存される" do
        @medicine.image = nil
        expect(@medicine).to be_valid
      end
    end

    context "処方管理が登録できない場合" do
      it "日付が空だと保存できない" do
        @medicine.start_time = nil
        @medicine.valid?
        expect(@medicine.errors.full_messages).to include("Start time can't be blank")
      end

      it "薬名が空だと保存できない" do
        @medicine.name = nil
        @medicine.valid?
        expect(@medicine.errors.full_messages).to include("Name can't be blank")
      end

      it "ユーザーが紐付いていないと登録できない" do
        @medicine.user = nil
        @medicine.valid?
        expect(@medicine.errors.full_messages).to include("User must exist")
      end
    end
  end
end
