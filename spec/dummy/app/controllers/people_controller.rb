class PeopleController < ApplicationController
  def index
    @people = [
      Person.new(first_name: "John", last_name: "Doe")
    ]
  end

  def admin
    @people = [
      Person.new(first_name: "Jane", last_name: "Doe")
    ]
  end
end