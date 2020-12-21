class Condition < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :start_time
    validates :temperature
    validates :weight
    validates :blood_max
    validates :blood_min
    validates :condition

    with_options numericality: { message: "半角数字で入力してください" } do
      validates :temperature
      validates :weight
      validates :blood_max
      validates :blood_min
    end

    validates :condition, :numericality => { :less_than_or_equal_to => 5, :message => "５以下の数字を入力してください" }
  end
end
