require_relative "../views/meals_view"

class MealsController
  def initialize(meal_repo)
    @meal_repo = meal_repo
    @view = MealsView.new
  end

  def add
    name = @view.ask_user_for("Name")
    price = @view.ask_user_for("Price")
    meal = Meal.new(name: name, price: price)
    @meal_repo.create(meal)
  end

  def edit
    list
    index = @view.ask_user_for_index
    new_name = @view.ask_user_for("New name")
    new_price = @view.ask_user_for_price
    @meal_repo.edit_meal(index, new_name, new_price)
    list
  end

  def destroy
    list
    index = @view.ask_user_for_index
    @meal_repo.remove_at(index)
    list
  end

  def list
    meals = @meal_repo.all
    @view.display(meals)
  end
end
