class CreateUserBooks < ActiveRecord::Migration
  def change
    create_table :user_books do |t|
      t.integer :user_id, :book_id
      t.timestamps
    end
  end
end
