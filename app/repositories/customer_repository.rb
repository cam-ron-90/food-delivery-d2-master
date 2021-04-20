require 'csv'
require_relative '../models/customer'

require_relative 'base_repository'

class CustomerRepository < BaseRepository
  def edit_customer(customer_id, customer_name, customer_address)
    customer = @elements[customer_id]
    customer.name = customer_name
    customer.address = customer_address
    save_csv
  end

  def self.csv_headers
    # Shorthand for Array of symbols:
    # %i[id name price] => [:id, :name, :price]
    # Shortand for Array of strings:
    # %w => ["id", "name", "price"]
    %i[id name address]
  end

  private

  # This private method is REFERENCED/CALLED in
  # BaseRepository.
  #
  # It needs to be defined here because MealRepository
  # and CustomerRepository differ in the type of elements
  # they are trying to create (Meal and Customer)
  #
  def build_element(row)
    # Unlike the meal, there are no customer specific
    # convertions to be done on Row
    Customer.new(row) # returns a Customer instance
  end

end
