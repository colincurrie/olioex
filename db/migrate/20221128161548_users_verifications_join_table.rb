class UsersVerificationsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :verifications
  end
end
