class Item < ActiveRecord::Base
	has_many :line_items
  validates :name, :price, presence: true
  validates :price, numericality: { greater_than: 0 }
end
