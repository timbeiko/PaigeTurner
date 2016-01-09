class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :handle
      t.string :email
      t.string :image
      t.string :uid
      t.string :provider
      t.string :token
      t.integer :expires_at
    end
  end
end
