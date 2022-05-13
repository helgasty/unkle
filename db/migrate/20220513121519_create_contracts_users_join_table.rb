class CreateContractsUsersJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :contracts, :users
  end
end
