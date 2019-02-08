class Constructor < ActiveRecord::Base
  include ActiveModel::Model
  has_many :results

  self.primary_key = 'constructor_id'
end
