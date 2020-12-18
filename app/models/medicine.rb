class Medicine < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  acts_as_taggable #タグ付け機能のGem追加
end
