class Order
  attr_accessor :id, :employee
  attr_reader :meal, :customer, :delivered

  def self.csv_headers
    %w[id delivered meal_id customer_id employee_id]
  end

  def initialize(attributes = {})
    @id = attributes[:id]
    @meal = attributes[:meal]
    @customer = attributes[:customer]
    @employee = attributes[:employee]
    @delivered = attributes[:delivered] || false
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end

  # We use this #to_array method to abstract our repository classes,
  # It makes sense the instance should know how to pass itself as relevant information for a csv row
  def to_array
    [@id, @delivered, @meal.id, @customer.id, employee.id]
  end

  def to_s
    "#{@employee.username.capitalize} must deliver #{@meal.name} to #{@customer.name} in #{@customer.address}"
  end
end
