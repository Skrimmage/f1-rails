class AddCircuits < ActiveRecord::Migration[5.2]
  def change
    create_table :circuits, id: false do |t|
      t.integer :circuit_id, primary_key: true, unique: true
      t.string  :circuit_ref
      t.string  :name
      t.string  :location
      t.string  :country
      t.float   :lat
      t.float   :long
      t.integer :alt
      t.string  :url

      t.timestamps
    end
  end
end
