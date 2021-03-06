require_relative 'message'

class TakeAway
  attr_reader :menu, :basket, :order_total, :message

  def initialize(message = Message.new)
    @menu = {
            "Sweet & Sour Chicken Balls" => 3.99,
            "Chicken Chowmein" => 4.50,
            "Crispy Shredded Beef" => 5.90,
            "Egg Fried Rice" => 3.00,
            "Fried Duck with Black Bean Sauce" => 6.40
            }
    @basket = {}
    @order_total = 0
    @message = message
  end

  def read_menu
    menu.each { |k, v| puts "#{k}: £#{'%.2f' % v}" }
  end

  def add_dish(dish, number = 1)
    # binding.pry
    fail "that dish isn't on the menu" unless menu.has_key?(dish)
    @basket.has_key?(dish) ? @basket[dish] += number : @basket[dish] = number
    @order_total += number * menu[dish]
  end

  def basket_total
    return 'there is nothing in your basket' if basket.empty?
    @basket.map { |k, v| "#{v}x #{k} = £#{'%.2f' % (v * menu[k])}" }.join(", ") + ". Total £#{'%.2f' % order_total}"
  end

  def checkout
    message.send_message
  end

end
