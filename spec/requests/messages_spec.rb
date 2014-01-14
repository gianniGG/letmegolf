require 'spec_helper'

describe "Messages" do
  subject { page }
  let(:user) { FactoryGirl.create(:user) }


  describe "New message" do
    before { visit new_user_message_path }
    describe "Submission without recipient or body" do
      # click_button 'blah'
      fill_in "name", with: user.name
      fill_in "password", with: user.password
      click_button "Send"
      it { should have_alert("Some details are incorrect") }
    end
  end
end
