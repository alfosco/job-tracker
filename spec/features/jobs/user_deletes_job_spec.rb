require 'rails_helper'

RSpec.feature "User deletes a job from a company" do
  scenario "the job is no longer there" do
    company = Company.create!(name: "ESPN")
    company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "New York City")

    visit company_jobs_path(company)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("QA Analyst")

    first(".job").click_button "Delete"

    expect(current_path).to eq("/companies/#{company.id}/jobs")
    
    expect(page).to_not have_content("Developer")
    expect(page).to have_content("QA Analyst")
  end
end
