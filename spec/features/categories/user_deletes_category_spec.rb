require 'rails_helper'

RSpec.feature "User deletes a category" do
  scenario "The user can delete a category" do
    category = Category.create(title: "Marketing")
    visit categories_path

    within(".category_#{category.id}") do
      click_button "Delete"
    end

    expect(page).to have_content("Marketing was successfully deleted!")
  end
end
