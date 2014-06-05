class CreateSelectablesSelectables < ActiveRecord::Migration
  def change
    create_table :selectables_selectables do |t|
      t.string :category
      t.string :value

      t.timestamps
    end
    add_index :selectables_selectables, [:category, :value]
  end
end
