class Post < ApplicationRecord
  belongs_to :user

  has_many :post_category_relations
  has_many :categories, through: :post_category_relations

  with_options presence: true do
    validates :start_time
    validates :title
    validates :reason
  end
end
