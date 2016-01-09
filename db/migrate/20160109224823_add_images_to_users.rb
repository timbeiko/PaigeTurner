class AddImagesToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :email
    add_column :users, :image, :string
  end
end
