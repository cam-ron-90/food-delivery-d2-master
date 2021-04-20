class Employee
  attr_accessor :id
  attr_reader :username, :password, :role

  def self.csv_headers
    %w[id name password role]
  end

  def initialize(attributes = {})
    @id = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role]
  end

  # Behaviors we need for our model to tell us what kind of role they have
  def manager?
    @role == "manager"
  end

  def rider?
    @role == "rider"
  end

  # We use this #to_array method to abstract our repository classes,
  # It makes sense the instance should know how to pass itself as relevant information for a csv row
  def to_array
    [@id, @username, @password, @role]
  end

  def to_s
    @username
  end
end
