class CreateMedicines < ActiveRecord::Migration[6.0]
  def change
    create_table :medicines do |t|
      t.string :name,     null: false
      t.date :start_time, null: false
      t.text :memo
      t.references :user, foreign_key:true
      t.timestamps
    end
  end
end
