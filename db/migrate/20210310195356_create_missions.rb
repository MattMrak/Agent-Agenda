class CreateMissions < ActiveRecord::Migration[6.1]
  def change
    create_table :missions do |t|
      t.string :operation
      t.text :objective

      t.timestamps
    end
  end
end
