require 'rails_helper'

RSpec.feature "User selects to edit a job on company jobs page" do
  scenario "they see the updated job on company jobs show page" do

    company = Company.create(name: "ESPN")
    job = company.jobs.create(title: "Developer", level_of_interest: 70, city: "Bristol")
    # As a user I visit the company jobs index page (company_jobs)
    visit company_jobs_path(company)
    # I see a list of all jobs for that company
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    # And I click 'Edit'
    click_button "Edit"
    # I am taken to a form
    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.first.id}/edit")
    # And I fill in a new title
    fill_in "job[title]", with: "Janitor"
    # And I click submit
    click_button "Update Job"
    # I am taken to the company job show page (company_job)
    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    # Then I see my updated attribute
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Janitor")

  end
end
