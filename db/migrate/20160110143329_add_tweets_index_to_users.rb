class AddTweetsIndexToUsers < ActiveRecord::Migration
  def change
    change_table(:users) { |t| t.integer :tweets_index }
  end
end
