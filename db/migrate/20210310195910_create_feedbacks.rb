class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.string :notes
      t.resources :user
      t.resources :mission

      t.timestamps
    end
  end
end
