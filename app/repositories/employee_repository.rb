require "csv"
require_relative "base_repository"
require_relative "../models/employee"


class EmployeeRepository < BaseRepository

  # These two methods are needed by the employee repository and extend the base repository class
  def all_riders
    @elements.select { |element| element.rider? }
  end

  def find_by_username(username)
    @elements.find { |element| element.username == username }
  end

  undef create

  private

  def build_element(row)
    Employee.new(row)
  end
end
