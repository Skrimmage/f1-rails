class Driver < ActiveRecord::Base
  include ActiveModel::Model
  has_many :results

  self.primary_key = 'driver_id'

  def name
    "#{forename} #{surname}"
  end

end
