class Condition < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :start_time
    validates :temperature
    validates :weight
    validates :blood_max
    validates :blood_min
    validates :condition

    with_options numericality: true do
      validates :temperature
      validates :weight
      validates :blood_max
      validates :blood_min
    end
  end
end
