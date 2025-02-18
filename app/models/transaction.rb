class Transaction < ApplicationRecord
  belongs_to :category

  def self.over_budget?(category, amount)
    return false unless category && category.budget 
    total = where(category: category).sum(:amount)
    total + amount > category.budget
  end
end
