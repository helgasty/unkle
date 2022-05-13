class CreateContracts < ActiveRecord::Migration[6.1]
  def change
    create_table :contracts do |t|
      t.string :numero
      t.integer :status
      t.datetime :begin_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
