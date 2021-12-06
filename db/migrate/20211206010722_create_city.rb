class CreateCity < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :shortname
      t.references :state, foreign_key: true, index: true

      t.timestamps
    end
  end
end
