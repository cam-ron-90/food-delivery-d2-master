class Meal
  # need to be able to read and write all when we edit
  attr_accessor :id, :price, :name

  # Meal.new({})
  def initialize(attributes = {})
    # Set initial instance
    @id = attributes[:id]
    @name = attributes[:name]
    @price = attributes[:price]
  end

  # This CLASS METHOD (note the self.csv_headers)
  # is REFERENCED/CALLED in BaseRepository.
  #
  # It needs to be defined in here because the Meal
  # and Customer differ in their headers.
  def self.csv_headers
    # Shorthand for Array of symbols:
    # %i[id name price] => [:id, :name, :price]
    # Shortand for Array of strings:
    # %w => ["id", "name", "price"]
    %i[id name price]
  end

  def to_array
    [@id, @name, @price]
  end
end
