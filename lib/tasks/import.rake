require 'csv'

namespace :import do
  desc "Importing data files"
  task all: :environment do
    circuits = []
    CSV.foreach('db/data/circuits.csv', headers: false) do |row|
      row.map! {|x| x == '\N' ? nil : x }
      c = Circuit.new
      c.circuit_id = row[0]
      c.circuit_ref = row[1]
      c.name = row[2]
      c.location = row[3]
      c.country = row[4]
      c.lat = row[5]
      c.long = row[6]
      c.alt = row[7]
      c.url = row[8]
      circuits << c
    end
    Circuit.import circuits, on_duplicate_key_update: [:circuit_id]


    races = []
    CSV.foreach('db/data/races.csv', headers: false) do |row|
      row.map! {|x| x == '\N' ? nil : x }
      r = Race.new
      r.race_id = row[0]
      r.year = row[1]
      r.round = row[2]
      r.circuit_id = row[3]
      r.name = row[4]
      r.date = row[5]
      r.time = row[6]
      r.url = row[7]
      races << r
    end
    Race.import races, on_duplicate_key_update: [:race_id]


    constructors = []
    CSV.foreach('db/data/constructors.csv', headers: false) do |row|
      row.map! {|x| x == '\N' ? nil : x }
      c = Constructor.new
      c.constructor_id = row[0]
      c.constructor_ref = row[1]
      c.name = row[2]
      c.nationality = row[3]
      c.url = row[4]
      constructors << c
    end
    Constructor.import constructors, on_duplicate_key_update: [:constructor_id]

    results = []
    CSV.foreach('db/data/results.csv', headers: false) do |row|
      row.map! {|x| x == '\N' ? nil : x }
      r = Result.new
      r.result_id = row[0]
      r.race_id = row[1]
      r.driver_id = row[2]
      r.constructor_id = row[3]
      r.number = row[4]
      r.grid = row[5]
      r.position = row[6]
      r.position_text = row[7]
      r.position_order = row[8]
      r.points = row[9]
      r.laps = row[10]
      r.time = row[11]
      r.milliseconds = row[12]
      r.fastest_lap = row[13]
      r.rank = row[14]
      r.fastest_lap_time = row[15]
      r.fastest_lap_speed = row[16]
      r.status_id = row[17]
      results << r
    end
    Result.import results, on_duplicate_key_update: [:result_id]

    drivers = []
    CSV.foreach('db/data/driver.csv', headers: false) do |row|
      row.map! {|x| x == '\N' ? nil : x }
      d = Driver.new
      d.driver_id = row[0].to_i
      d.driver_ref = row[1]
      d.number = row[2]
      d.code = row[3]
      d.forename = row[4]
      d.surname = row[5]
      d.dob = row[6].nil? ? nil : Date.parse(row[6])
      d.nationality = row[7]
      d.url = row[8]
      drivers << d
    end
    Driver.import drivers, on_duplicate_key_update: [:driver_id]
  end
end
