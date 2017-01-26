require 'rails_helper'

RSpec.describe "cars/index", type: :view do
  before(:each) do
    assign(:cars, [
      Car.create!(
        :brand => "Brand",
        :model => "Model",
        :age_in_km => 2,
        :user => nil
      ),
      Car.create!(
        :brand => "Brand",
        :model => "Model",
        :age_in_km => 2,
        :user => nil
      )
    ])
  end

  it "renders a list of cars" do
    render
    assert_select "tr>td", :text => "Brand".to_s, :count => 2
    assert_select "tr>td", :text => "Model".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
