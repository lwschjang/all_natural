class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :desc
      t.text :ingredients
      t.string :used_for

      t.timestamps
    end
  end
end
