class Place < ActiveRecord::Base
  attr_accessible :address, :name, :zip
end
