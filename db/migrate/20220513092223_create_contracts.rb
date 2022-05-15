class CreateContracts < ActiveRecord::Migration[6.1]
  def change
    create_table :contracts do |t|
      t.string :numero
      t.text :details
      t.float :amount
      t.integer :status, default: 0
      t.date :begin_date
      t.date :end_date

      t.timestamps
    end
  end
end
