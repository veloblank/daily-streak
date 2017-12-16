class CreateList < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.text :name
      t.integer :user_id
      t.timestamp null: false
    end
  end
end
