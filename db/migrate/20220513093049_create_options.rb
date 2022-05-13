class CreateOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :options do |t|
      t.string :code
      t.text :description

      t.timestamps
    end
  end
end
