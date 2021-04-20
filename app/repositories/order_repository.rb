require "csv"
require_relative "base_repository"
require_relative "../models/order"

class OrderRepository < BaseRepository
  def initialize(csv_file, meal_repository, customer_repository, employee_repository)
    # We deliver our repos that the order repository needs access to in a hash
    # The order repository needs access to all other repos because it needs a way to deserialize from id to instance in the load csv method
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    # This super here calls the initialize method in the Base Repository class.  Remember that initialize method only takes one argument, the csv file
    super(csv_file)
  end

  def undelivered_orders
    @elements.reject { |order| order.delivered? }
  end

  def mark_as_delivered(order)
    order.deliver!
    save_csv
  end

  def my_undelivered_orders(employee)
    # The condition we select on here is if the order is associated to the employee as well as if it has NOT been delivered
    @elements.select { |order| order.employee == employee && !order.delivered? }
  end

  private

  def build_element(row)
    row[:delivered] = row[:delivered] == "true"
    row[:meal] = @meal_repository.find(row[:meal_id].to_i)
    row[:customer] = @customer_repository.find(row[:customer_id].to_i)
    row[:employee] = @employee_repository.find(row[:employee_id].to_i)
    Order.new(row)
  end
end
