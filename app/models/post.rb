class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category

  with_options presence: true do
    validates :start_time
    validates :title
    validates :reason
  end

  def self.search(search)
    if search != ""
      Post.where('title LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
end
