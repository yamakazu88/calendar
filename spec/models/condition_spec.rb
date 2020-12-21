require 'rails_helper'

RSpec.describe Condition, type: :model do
  before do
    @data = FactoryBot.build(:condition)
  end

  describe '体調記録の保存' do
    context "体調記録が保存できる場合" do
      it "全ての項目があれば保存される" do
        expect(@data).to be_valid
      end

      it "メモが空でも保存される" do
        @data.memo = nil
        expect(@data).to be_valid
      end
    end

    context "体調記録が保存できない場合" do
      it "日付が空だと保存できない" do
        @data.start_time = nil
        @data.valid?
        expect(@data.errors.full_messages).to include("Start time can't be blank")
      end

      it "体温が空だと保存できない" do
        @data.temperature = nil
        @data.valid?
        expect(@data.errors.full_messages).to include("Temperature can't be blank")
      end

      it "体温が文字列だと保存できない" do
        @data.temperature = "aaa"
        @data.valid?
        expect(@data.errors.full_messages).to include("Temperature 半角数字で入力してください")
      end

      it "体温が半角数字でないと保存できない" do
        @data.temperature = "３６．５"
        @data.valid?
        expect(@data.errors.full_messages).to include("Temperature 半角数字で入力してください")
      end

      it "体重が空だと保存できない" do
        @data.weight = nil
        @data.valid?
        expect(@data.errors.full_messages).to include("Weight can't be blank")
      end

      it "体重が文字列だと保存できない" do
        @data.weight = "aaa"
        @data.valid?
        expect(@data.errors.full_messages).to include("Weight 半角数字で入力してください")
      end

      it "体重が半角数字でないと保存できない" do
        @data.weight = "６２．５"
        @data.valid?
        expect(@data.errors.full_messages).to include("Weight 半角数字で入力してください")
      end

      it "最高血圧が空だと保存できない" do
        @data.blood_max = nil
        @data.valid?
        expect(@data.errors.full_messages).to include("Blood max can't be blank")
      end

      it "最高血圧が文字列だと保存できない" do
        @data.blood_max = "aaa"
        @data.valid?
        expect(@data.errors.full_messages).to include("Blood max 半角数字で入力してください")
      end

      it "最高血圧が半角数字でないと保存できない" do
        @data.blood_max = "１００"
        @data.valid?
        expect(@data.errors.full_messages).to include("Blood max 半角数字で入力してください")
      end

      it "最低血圧が空だと保存できない" do
        @data.blood_min = nil
        @data.valid?
        expect(@data.errors.full_messages).to include("Blood min can't be blank")
      end

      it "最低血圧が文字列だと保存できない" do
        @data.blood_min = "aaa"
        @data.valid?
        expect(@data.errors.full_messages).to include("Blood min 半角数字で入力してください")
      end

      it "最低血圧が半角数字でないと保存できない" do
        @data.blood_min = "７０"
        @data.valid?
        expect(@data.errors.full_messages).to include("Blood min 半角数字で入力してください")
      end

      it "体調が空だと保存できない" do
        @data.condition = nil
        @data.valid?
        expect(@data.errors.full_messages).to include("Condition can't be blank")
      end

      it "体調が文字列だと保存できない" do
        @data.condition = "aaa"
        @data.valid?
        expect(@data.errors.full_messages).to include("Condition ５以下の数字を入力してください")
      end

      it "体調が５以下でないと保存できない" do
        @data.condition = 6
        @data.valid?
        expect(@data.errors.full_messages).to include("Condition ５以下の数字を入力してください")
      end

      it "ユーザーが紐付いていないと保存できない" do
        @data.user = nil
        @data.valid?
        expect(@data.errors.full_messages).to include("User must exist")
      end
    end
  end
end
