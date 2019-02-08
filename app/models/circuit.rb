class Circuit < ActiveRecord::Base
  include ActiveModel::Model
  has_many :races

  self.primary_key = 'circuit_id'
end
