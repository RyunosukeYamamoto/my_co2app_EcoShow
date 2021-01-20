class CreateEcos < ActiveRecord::Migration[5.2]
  def change
    create_table :ecos do |t|
      t.string :action
      t.integer :co2

      t.timestamps
    end
  end
end
