require "rails_helper"

RSpec.describe "rendering view using methods", type: :feature do
  describe "rendering a specific partial" do
    it "should render the specified partial" do
      visit "/people"
    end
  end
end