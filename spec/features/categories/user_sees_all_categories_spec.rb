require 'rails_helper'

RSpec.feature "User can see all categories" do
  scenario "The user sees all the categories" do
    category_1 = Category.create(title: "Banking")
    category_2 = Category.create(title: "Athletics")

    visit categories_path

    expect(page).to have_content("Banking")
    expect(page).to have_content("Athletics")
  end
end
