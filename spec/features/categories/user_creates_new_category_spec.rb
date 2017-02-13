require 'rails_helper'

RSpec.feature "User creates a new category" do
  scenario "the user creates a new category" do
    visit new_category_path

    fill_in "category[title]", with: "Finance"
    click_button "Create"

    expect(current_path).to eq("/categories/#{Category.last.id}")
    expect(page).to have_content("Finance")
    expect(Category.count).to eq(1)
  end
end
