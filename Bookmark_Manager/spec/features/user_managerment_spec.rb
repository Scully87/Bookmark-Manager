require 'spec_helper'

feature "User signs up" do 

	scenario "when being logged out" do 
		expect{ sign_up }.to change(User, :count).by(1)
		expect(page).to have_content("Welcome, scully@example.com")
		expect(User.first.email).to eq("scully@example.com")
	end

	def sign_up(email = "scully@example.com", password = "toilet")
		visit '/users/new'
		expect(page.status_code).to eq(200)
		fill_in :email, :with => email
		fill_in :password, :with => password
		click_button "Sign up"
	end
end