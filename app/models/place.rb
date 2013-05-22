class Place < ActiveRecord::Base
  attr_accessible :address, :name, :zip, :picture, :country, :comments

  validates :address, :name, :presence => true

  validates :zip, :numericality => { :only_integer => true },
                  :length => { :is => 5 },
                  :presence => true

  mount_uploader :picture, PictureUploader

  geocoded_by :full_address
  after_validation :geocode
  acts_as_gmappable :process_geocoding => false

  def full_address
    address + ' ' + zip
  end  

end
