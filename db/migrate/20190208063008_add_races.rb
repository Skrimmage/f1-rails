class AddRaces < ActiveRecord::Migration[5.2]
  def change
    create_table :races, id: false do |t|
      t.integer :race_id, primary_key: true, unique: true
      t.integer :year
      t.integer :round
      t.integer :circuit_id
      t.string  :name
      t.date    :date
      t.time    :time
      t.string  :url


      t.timestamps
    end
  end
end
