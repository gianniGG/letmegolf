
require 'spec_helper'

describe "Sessions" do
  before { visit signin_path }
  let(:user) {FactoryGirl.create(:user)}
  subject { page }

  describe "invalid signin (sessions#new)" do

    describe "missing field entry (password)" do
      before do
        fill_in "Name", with: user.name
        click_button "Enter"
      end

      it { should have_selector('div.alert.alert-warning') }
      it { should have_content "Incorrect credentials." }

      context "page content" do
        it { should_not have_link "Account" }
        it { should have_link "Sign in" }
      end
    end

  end

  describe "valid signin (sessions#new)" do
    before do
      fill_in "Name", with: user.name
      fill_in "Password", with: user.password
      click_button "Enter"
    end

    it { should have_selector "div.alert.alert-success" }
    it { should have_content "Welcome" }

    context "page content" do
      it { should have_link "Account" }
      it { should have_link "Inbox"}
    end
  end

  describe "sign out (sessions#destroy)" do
    before do
      sign_in user
      click_link "Sign Out"
    end

    it { should have_selector "div.alert.alert-success" }
    it { should have_content "See you soon!" }
    it { should_not have_link "Account" }
    it { should_not have_link "Multiplayer" }

  end

end
