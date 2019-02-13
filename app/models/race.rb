class Race < ActiveRecord::Base
  include ActiveModel::Model
  belongs_to :circuit
  has_many :results

  self.primary_key = 'race_id'
  
  def winner
    results.find_by_position(1)
  end

  def finished
    results.where("status_id in (1, 11, 12, 13, 14, 15, 16, 17, 18, 19)ex").count
  end
end
