class OrdersView
  def display(elements)
    elements.each_with_index do |element, index|
      # String interpolation by default calls to_s on whatever it is trying to interpolate, when we wrote over to_s we choose to return a string that displays the information for the element in the way we desire
      puts "#{index + 1}. #{element}"
    end
  end

  def ask_user_for(stuff)
    puts "Please provide a(n) #{stuff.downcase}."
    print "> "
    return gets.chomp
  end

  def ask_user_for_index
    puts "Index?"
    print "> "
    gets.chomp.to_i - 1
  end

  def prompt_for(stuff)
    puts "Choose a #{stuff}"
  end
end
