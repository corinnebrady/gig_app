class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :venue
      t.string :city
      t.string :address
      t.datetime :date
      t.text :website

      t.timestamps
    end
  end
end
