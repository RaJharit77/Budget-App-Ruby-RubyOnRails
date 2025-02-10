# Supprimer toutes les données existantes
Transaction.destroy_all
Category.destroy_all

# Créer des catégories
categories = [
  { name: "Food" },
  { name: "Transport" },
  { name: "Entertainment" },
  { name: "Utilities" }
]

categories.each do |category|
  Category.create(category)
end

# Créer des transactions
transactions = [
  { amount: 50.0, date: Date.today, description: "Groceries", category: Category.find_by(name: "Food") },
  { amount: 20.0, date: Date.today, description: "Bus fare", category: Category.find_by(name: "Transport") },
  { amount: 100.0, date: Date.today, description: "Movie tickets", category: Category.find_by(name: "Entertainment") },
  { amount: 80.0, date: Date.today, description: "Electricity bill", category: Category.find_by(name: "Utilities") }
]

transactions.each do |transaction|
  Transaction.create(transaction)
end

puts "Seed data created successfully!"
