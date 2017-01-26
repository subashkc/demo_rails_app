require 'rails_helper'

RSpec.describe "cars/new", type: :view do
  before(:each) do
    assign(:car, Car.new(
      :brand => "MyString",
      :model => "MyString",
      :age_in_km => 1,
      :user => nil
    ))
  end

  it "renders new car form" do
    render

    assert_select "form[action=?][method=?]", cars_path, "post" do

      assert_select "input#car_brand[name=?]", "car[brand]"

      assert_select "input#car_model[name=?]", "car[model]"

      assert_select "input#car_age_in_km[name=?]", "car[age_in_km]"

      assert_select "input#car_user_id[name=?]", "car[user_id]"
    end
  end
end
