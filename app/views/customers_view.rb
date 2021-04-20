class CustomersView

  def display(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1}. #{customer.name} : #{customer.address}"
    end
  end

  def ask_user_for(input)
    puts "#{input.capitalize}?"
    print "> "
    gets.chomp
  end

  def ask_user_for_index
    puts "Id?"
    print "> "
    gets.chomp.to_i - 1
  end

end
