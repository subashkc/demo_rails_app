require 'rails_helper'

RSpec.describe "cars/edit", type: :view do
  before(:each) do
    @car = assign(:car, Car.create!(
      :brand => "MyString",
      :model => "MyString",
      :age_in_km => 1,
      :user => nil
    ))
  end

  it "renders the edit car form" do
    render

    assert_select "form[action=?][method=?]", car_path(@car), "post" do

      assert_select "input#car_brand[name=?]", "car[brand]"

      assert_select "input#car_model[name=?]", "car[model]"

      assert_select "input#car_age_in_km[name=?]", "car[age_in_km]"

      assert_select "input#car_user_id[name=?]", "car[user_id]"
    end
  end
end
