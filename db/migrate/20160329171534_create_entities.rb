class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.string :entity_type, limit: 80
      t.string :external_id, limit: 40
      t.index [:entity_type, :external_id]

      t.timestamps null: false
    end
  end
end
