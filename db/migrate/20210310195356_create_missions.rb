class CreateMissions < ActiveRecord::Migration[6.1]
  def change
    create_table :missions do |t|
      t.string :operation
      t.text :objective
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
