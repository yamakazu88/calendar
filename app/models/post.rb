class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category

  with_options presence: true do
    validates :start_time
    validates :title
    validates :reason
  end
end
