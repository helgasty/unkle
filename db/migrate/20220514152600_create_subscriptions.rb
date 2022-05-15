class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions do |t|
      t.belongs_to :contract
      t.belongs_to :user
      t.datetime :subscribed_at
      t.datetime :end_subscription_at

      t.timestamps
    end
  end
end
