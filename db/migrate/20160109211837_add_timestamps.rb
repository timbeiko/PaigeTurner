class AddTimestamps < ActiveRecord::Migration
  def change
    change_table(:users) { |t| t.timestamps }
    change_table(:books) { |t| t.timestamps }
    change_table(:tweets) { |t| t.timestamps }
  end
end
