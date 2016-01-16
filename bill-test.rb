puts ""
puts "Restaurant Bill"
puts "---------------"
puts ""
bill = 32.71
puts "Your bill is $#{bill.round(2).to_s}"
tip = bill * 1.15
tip = tip - bill
puts "With 15% tip it adds $#{tip.round(2).to_s}"
total = bill + tip
puts "Total is $#{total.round(2).to_s}"
