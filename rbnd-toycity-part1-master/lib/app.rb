require 'json'
path = File.join(File.dirname(__FILE__), '../data/products.json')
file = File.read(path)
products_hash = JSON.parse(file)

# Print today's date
puts '                     _            _       '
puts '                    | |          | |      '
puts ' _ __  _ __ ___   __| |_   _  ___| |_ ___ '
puts "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
puts '| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\'
puts '| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/'
puts '| |                                       '
puts '|_|                                       '
puts
puts

# For each product in the data set:
products_hash['items'].each do |toy|
  # Print the name of the toy

  puts "Name: #{toy['title']}"

  # Print the retail price of the toy

  puts "Price: $#{toy['full-price']}"

  # Calculate and print the total number of purchases
  # Calcalate and print the total amount of sales
  # Calculate and print the average price the toy sold for
  # Calculate and print the average discount based off the average sales price

  ## Initializing Variables
  totalPurchases = 0
  totalSales = 0
  totalPurchasesPrice = 0
  totalSalesDiscount = 0
  averagePrice = 0
  averageDiscount = 0

  toy['purchases'].each do |purchase|
    totalPurchases += 1
    totalPurchasesPrice += purchase['price']
    ## Had to change full-price from string to float for the conditional
    if purchase['price'] < toy['full-price'].to_f
      totalSales += 1
      totalSalesDiscount += toy['full-price'].to_f - purchase['price']
    end
  end

  averagePrice = totalPurchasesPrice / totalPurchases
  averagePrice = '%.2f' % averagePrice
  averageDiscount = totalSalesDiscount / totalSales
  averageDiscount = '%.2f' % averageDiscount

  puts "Total of Purchases: #{totalPurchases}"
  puts "Total of Sales: #{totalSales}"
  puts "Average Price: $#{averagePrice}"
  puts "Average Discount: $#{averageDiscount}"
  # Jump a line
  puts
end

puts ' _                         _     '
puts '| |                       | |    '
puts '| |__  _ __ __ _ _ __   __| |___ '
puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
puts '| |_) | | | (_| | | | | (_| \\__ \\'
puts '|_.__/|_|  \\__,_|_| |_|\\__,_|___/'
puts
puts

# For each brand in the data set:
## Get Brands
brands = []

products_hash['items'].each do |toy|
  brands.push(toy['brand'])
end

## Filter Brands
brands.uniq!

brands.each do |brand|
  ## Initializing Variables
  totalToys = 0
  totalToysPrice = 0
  averageToysPrice = 0
  totalRevenue = 0

  # Print the name of the brand
  puts "Brand: #{brand}"

  # Count and print the number of the brand's toys we stock
  # Calculate and print the average price of the brand's toys
  # Calculate and print the total revenue of all the brand's toy sales combined
  products_hash['items'].each do |toy|
    next unless brand == toy['brand']
    totalToys += 1
    totalToysPrice += toy['full-price'].to_f

    toy['purchases'].each do |purchase|
      totalRevenue += purchase['price']
    end
  end

  averageToysPrice = totalToysPrice / totalToys
  averageToysPrice = '%.2f' % averageToysPrice
  totalRevenue = '%.2f' % totalRevenue

  puts "Total Toys: #{totalToys}"
  puts "Average Toys Price: $#{averageToysPrice}"
  puts "Total Revenue: $#{totalRevenue}"
  puts
end
