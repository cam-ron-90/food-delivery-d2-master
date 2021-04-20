class Customer
  # need to be able to read and write all when we edit
  attr_accessor :id, :name, :address

  # Customer.new({})
  def initialize(attributes = {})
  # Set initial instance
    @id = attributes[:id]
    @name = attributes[:name]
    @address = attributes[:address]
  end

  # This CLASS METHOD (note the self.csv_headers)
  # is REFERENCED/CALLED in BaseRepository.
  #
  # It needs to be defined in here because the Meal
  # and Customer differ in their headers.
  #
  # It makes sense that the class would know
  # what CSV headers are needed to persist
  # instances of itself.
  #
  def self.csv_headers
    # Shorthand for Array of symbols:
    # %i[id name price] => [:id, :name, :price]
    # Shortand for Array of strings:
    # %w => ["id", "name", "price"]
    %i[id name address]
  end

  def to_array
    [@id, @name, @address]
  end
end
