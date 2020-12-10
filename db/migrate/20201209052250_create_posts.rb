class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.datetime   :start_time,   null: false
      t.string     :title,    null: false
      t.string     :reason,   null: false
      t.text       :memo
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
