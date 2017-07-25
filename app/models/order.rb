class Order < ActiveRecord::Base
	has_many :line_items, dependent: :destroy
  belongs_to :user

	accepts_nested_attributes_for :line_items, allow_destroy: true

 
  before_save :update_total_amount

  def total_amount
    # binding.pry
    line_items.collect { |li| li.valid? ? (li.quantity * li.item.price) : 0 }.sum
  end
  
  private
  
  def update_total_amount
    self[:total_amount] = total_amount
  end

end
