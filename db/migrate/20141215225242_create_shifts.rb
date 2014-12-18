class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.references :user, null: false, index: true
      t.date :shift_date, null: false
      t.integer :shift_time
      t.text :notes

      t.timestamps
    end
  end
end
