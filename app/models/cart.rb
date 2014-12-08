class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :line_items, dependent: :destroy
  belongs_to :cart
  belongs_to :items
  attr_accessible :category, :description, :image_url, :price, :title
  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
  def add_item(item_id)
    current_item = line_items.find_by_product_id(item_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(item_id: item_id)
    end
    current_item
  end
  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
end
