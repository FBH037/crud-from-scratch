require "rails_helper"

describe 'user can CRUD StatusUpdate' do
  scenario 'user can create StatusUpdate' do
    visit '/'
    click_on 'New Status'
    fill_in 'User', :with => 'finn'
    fill_in 'Status', :with => 'capy_test'
    fill_in "Number of likes", :with => 3
    click_on 'Create Status'
    expect(page).to have_content('capy_test')
    StatusUpdate.destroy_all
  end
  scenario 'user can view StatusUpdate show page' do
    @status = StatusUpdate.create(user: "finn", status: "hungry", number_of_likes: 4)
    visit "/status_updates/#{@status.id}"
    expect(page).to have_content('hungry')
  end
  scenario 'user can update a StatusUpdate' do
    @status = StatusUpdate.create(user: "finn", status: "hungry", number_of_likes: 4)
    visit "/"
    click_on "Edit"
    fill_in 'Status', :with => 'hangry'
    click_on "Update Status"
    expect(page).to have_content('hangry')
  end
  scenario 'user can delet a StatusUpdate' do
    @status = StatusUpdate.create(user: "finn", status: "hungry", number_of_likes: 4)
    visit "/"
    click_on "Delete"
    expect(page).to have_no_content('hungry')
  end
end
