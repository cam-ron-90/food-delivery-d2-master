require_relative '../views/customers_view'
require_relative '../repositories/customer_repository'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customers_view = CustomersView.new
  end

  def add
    # Ask user for a name
    name = @customers_view.ask_user_for('name')
    # Ask use for a address
    address = @customers_view.ask_user_for('address')
    # Make a customer instance
    customer = Customer.new(name: name, address: address)
    # Create it in the customer repo
    @customer_repository.create(customer)
    # list the customers again to show you were successful
    list
  end

  def edit
    list
    customer_id = @customers_view.ask_user_for_index
    customer_name = @customers_view.ask_user_for("New name")
    customer_address = @customers_view.ask_user_for("New address")
    @customer_repository.edit_customer(customer_id, customer_name, customer_address)
    list
  end

  def destroy
    list
    customer_id = @customers_view.ask_user_for_index
    @customer_repository.remove_at(customer_id)
    list
  end

  def list
    # Retrieve all of the customers
    customers = @customer_repository.all
    # Display the customers
    @customers_view.display(customers)
  end
end
