module CartsHelper
  $subtotal_amount = 0
  $total_amount = 0

  attr_reader :subtotal_amount, :total_amount

  def get_subtotal(price, quantity)
    $subtotal_amount = price * quantity
    $subtotal_amount.to_s.slice(0..-3)
  end

  def get_total(cart_items)
    $total_amount = 0

    cart_items.each do |item|
      price = item.price_cents.to_s.slice(0..-3)
      $total_amount += price.to_i * item.quantity
    end

    $total_amount
  end
end
