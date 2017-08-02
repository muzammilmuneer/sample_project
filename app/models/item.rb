class Item < ActiveRecord::Base
	has_many :line_items
  validates :name, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  before_destroy :ensure_not_referenced_by_any_line_item

  private

  def ensure_not_referenced_by_any_line_item
    return true if line_items.empty?
    errors.add(:base, "line_items present")
    return false
  end

end