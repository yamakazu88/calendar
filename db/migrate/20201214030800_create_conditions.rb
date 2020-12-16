class CreateConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :conditions do |t|
      t.datetime   :start_time, null: false
      t.float      :temperature
      t.float      :weight
      t.integer    :blood_max
      t.integer    :blood_min
      t.integer    :condition,  null: false
      t.text       :memo
      t.references :user,       foreign_key: true
      t.timestamps
    end
  end
end
