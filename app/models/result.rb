class Result < ActiveRecord::Base
  include ActiveModel::Model
  belongs_to :race
  belongs_to :driver
  belongs_to :constructor

  self.primary_key = 'result_id'

  def to_s
    "#{driver.name} | #{constructor.name} | #{position} | #{points} | #{fastest_lap_time}"
  end
end
