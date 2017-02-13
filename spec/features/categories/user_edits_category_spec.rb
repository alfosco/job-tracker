require 'rails_helper'

RSpec.feature "User edits a category" do
  scenario "The user can edit a category" do
    category = Category.create(title: "Advertising")
    visit edit_category_path(category)

    fill_in "category[title]", with: "Medical"
    click_button "Update"

    expect(current_path).to eq("/categories/#{Category.last.id}")
    expect(page).to have_content("Medical")
    expect(page).to_not have_content("Advertising")
  end
end
