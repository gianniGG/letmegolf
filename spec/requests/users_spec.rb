require 'spec_helper'

describe "Users" do

  let(:user) { FactoryGirl.create(:user) }
  subject { page }

  describe "valid sign up" do
    before { visit signup_path }

    describe "sign up without entering any details" do

    before {click_button "Join Up!" }
      it { should have_selector('div.alert.alert-warning') }
      it { should have_content "Name can't be blank" }
      it { should have_content "Email can't be blank" }
    end

    describe "sign up with existing username" do

      before do
        fill_in :user_name, with: user.name
        click_button "Join Up!"
      end
      it { should have_content('Name has already been taken')}
    end

    describe "valid new signup" do
      before do
        fill_in "Name", with: 'Nadia'
        fill_in "Email", with: 'Nadia@bar.com'
        fill_in "Password", with: user.password
        fill_in 'user_password_confirmation', with: user.password_confirmation
        click_button "Join Up!"
      end

      specify { expect(User.count).to be 2 }

      context "redirect to welcome page" do
        it { should have_selector('div.alert.alert-success') }
        it { should have_content "Hello" }
      end

    end
  end

  describe "edit user (users#edit & update)" do
    context "incorrect info entered" do
      before do
        sign_in user
        visit user_edit_path(user)
        click_link "Change password"
        fill_in "Old password", with: user.password
      end



    end

  end

end


























































