module LineItemsHelper
  def calculate_line_item_total(line_item)
    line_item.quantity * line_item.item.price
  end
end
