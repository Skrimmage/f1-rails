class AddConstructors < ActiveRecord::Migration[5.2]
  def change
    create_table :constructors, id: false do |t|
      t.integer :constructor_id, primary_key: true, unique: true
      t.string  :constructor_ref
      t.string  :name
      t.string  :nationality
      t.string  :url

      t.timestamps
    end
  end
end
