require "rails_helper"

describe 'log in/out process' do
  it "logs in user with correct params" do
    visit log_in_path
    user = User.create(username: 'test', password: 'test')
    fill_in 'username', :with => 'test'
    fill_in 'password', :with => 'test'
    click_on 'Log in'
    expect(page).to have_content 'You have been logged in'
  end

  it "displays error when incorrect login information is inputted" do
    visit log_in_path
    fill_in 'username', :with => 'test'
    fill_in 'password', :with => 'test'
    click_on 'Log in'
    expect(page).to have_content 'Please try again'
  end

  it "logs user out" do
    visit log_in_path
    user = User.create(username: 'test', password: 'test')
    fill_in 'username', :with => 'test'
    fill_in 'password', :with => 'test'
    click_on 'Log in'
    click_on 'LOG OUT'
    expect(page).to have_content "You've been logged out"
  end
end
