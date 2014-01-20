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

      specify { expect(User.count).to eq 2 }

      context "redirect to welcome page" do
        it { should have_selector('div.alert.alert-success') }
        it { should have_content "Hello" }
      end

    end
  end

  describe "edit user (users#edit & update)" do
    before do
      visit signin_path
      fill_in "Name",   with: user.name
      fill_in "Password", with: 'foobar'
      click_button "Enter"
      visit edit_user_path(user)
    end

    context "page content" do
      it { should have_link "Change password" }
    end

    describe "with incomplete form" do
      before { click_button "Make changes" }
      it { should have_selector('div.alert.alert-warning') }
    end

    describe "with correct old pw and new pws" do
      before do
        fill_in "Old password", with: 'foobar'
        fill_in "New password", with: '123456'
        fill_in :user_password_confirmation, with: '123456'
        click_button "Make changes"
      end

      it { should have_selector('div.alert.alert-success') }

    end

  end

end


























































