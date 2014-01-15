require 'spec_helper'

describe "Users" do

  let(:user) { FactoryGirl.create(:user) }
  subject { page }

  describe "visiting pages that require login" do
    context "user#show" do
      before { visit user_path(user) }
      it { should have_title(full_title('Sign In')) }
      it { should have_selector('div.alert.alert-warning') }
    end

    context "user#edit" do
      before { visit edit_user_path(user) }
      it { should have_title(full_title('Sign In')) }
      it { should have_selector('div.alert.alert-warning') }
    end

  end

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

      specify { expect(User.count).to eq 2 }

      context "redirect to welcome page" do
        it { should have_selector('div.alert.alert-success') }
        it { should have_content "Hello" }
      end

    end
  end

  describe "edit user (users#edit & update)" do
    before do
      # sign_in user
        visit signin_path
      fill_in "Name",   with: user.name
      fill_in "Password", with: 'foobar'
      click_button "Enter"
      visit edit_user_path(user)
      click_link "Change password"
      # fill_in "Old password", with: user.password
    end

    context "page content" do
      it { should have_link "Change password" }
    end

    describe "with incomplete form" do
      before { click_button "Make changes" }
      it { should have_selector('div.alert.alert-warning') }
    end

  end

end


























































