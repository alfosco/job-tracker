require 'rails_helper'

RSpec.feature "User can see one category" do
  scenario "The user can see one category" do
    company = Company.create(name: "USAA")
    category = Category.create(title: "Banking")
    company.jobs.create(title: "Developer", level_of_interest: 90, city: "Denver", category_id: category)

    visit category_path(category)

    expect(current_path).to eq("/categories/#{category.id}")
    expect(page).to have_content("Banking")
    expect(page).to have_content("Developer")
  end
end
