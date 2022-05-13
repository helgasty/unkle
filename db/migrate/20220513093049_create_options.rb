class CreateOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :options do |t|
      t.string :code
      t.text :desctiption

      t.timestamps
    end
  end
end
