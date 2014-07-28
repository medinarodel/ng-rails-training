class Widget < ActiveRecord::Base
  validates :price, presence: true, numericality: { greater_than: 10 } 
  validates :name, presence: true, length: { minimum: 7 }
end
