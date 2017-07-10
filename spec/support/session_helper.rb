require "spec_helper"

module SessionHelper
  def login_user(user = nil, password: "password1234")
    @user = user || FactoryGirl.create(:user)

    # logout_user
    visit root_path

    fill_in "Email", with: @user.email
    fill_in "Password", with: password

    click_button "Login"
  end

  def logout_user
    visit logout_path
  end
end
