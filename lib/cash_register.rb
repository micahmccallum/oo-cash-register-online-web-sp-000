require 'pry'
class CashRegister
  attr_accessor :last_amount, :items, :total, :discount

  def initialize(discount = nil)
    self.discount = discount
    self.total = 0
    self.items = []
    self.last_amount = 0
  end

  def add_item(title, price, quantity = 1)
    i = 0
    self.last_amount = 0
    while i < quantity
      self.total += price
      self.items << title
      self.last_amount += price
      i += 1
    end
  end

  def apply_discount
    if discount
      self.total -= ((self.discount * self.total) / 100)
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total -= self.last_amount
  end
end
