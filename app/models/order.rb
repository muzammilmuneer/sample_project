class Order < ActiveRecord::Base
	has_many :line_items, dependent: :destroy
  belongs_to :user
	accepts_nested_attributes_for :line_items, allow_destroy: true
  after_save :update_total_amount

  def get_amount
    line_items.to_a.sum { |line_item| line_item.quantity * line_item.item.price }
  end
  
  def send_email_for_order_creation
    User.admins.each do |user| 
      NewOrderMailer.send_email_to_admin(user).deliver
    end 
  end

  protected
  
  def update_total_amount
    self.update_column(:total_amount, get_amount)
  end


end
