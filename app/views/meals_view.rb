class MealsView
  def display(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1}: #{meal.name} $#{meal.price}"
    end
  end

  def ask_user_for(something)
    puts "#{something}?"
    print "> "
    gets.chomp
  end

  def ask_user_for_index
    puts "Id?"
    print "> "
    gets.chomp.to_i - 1
  end

  def ask_user_for_price
    puts "New price?"
    print "> "
    gets.chomp.to_i
  end
end
