require 'spec_helper'

describe "Groups" do

  let(:user) { FactoryGirl.create(:user) }
  let(:another_user) { FactoryGirl.create(:another_user) }
  let(:a_third_user) { FactoryGirl.create(:a_third_user) }
  let(:fourth_user) { FactoryGirl.create(:fourth_user) }

  before { sign_in user }
  subject { page }

  describe "list groups (groups#index)" do
    before { visit groups_path }
    context "have link to create a group" do
      it { should have_link "New group" }
    end

    it { should have_content "Affiliations" }

  end

  describe "creating a group groups#new" do
    before { visit new_group_path }
    it { should have_content "Create a new Affiliation" }

    describe "submitting valid group" do
      before do
        fill_in :group_name, with: "ARandomGroupName"
        fill_in :group_admins, with: ""
        click_button "Make group"
      end

      it { should have_content "Group created." }
      it { should have_selector "div.alert.alert-success"}
    end

    describe "join a group when already member of another" do
      before do
        fill_in :group_name, with: "ARandomGroupName"
        click_button "Make group"
        visit new_group_path
        fill_in :group_name, with: "AnotherGroupName"
        click_button "Make group"
      end
      it do
        raise page.html
      end
      it { should have_selector 'div.alert.alert-warning', text: "cannot belong to more than one group" }
    end

    describe "entering a group name that already exists" do
      before do
        visit new_group_path
        fill_in :group_name, with: "ARandomGroupName"
        click_button "Make group"
        sign_out
        sign_in another_user
        visit new_group_path
        fill_in :group_name, with: "ARandomGroupName"
        click_button "Make group"
      end

      it { should have_content "Name has already been taken" }
      it { should have_selector "div.alert.alert-warning"}

    end

  end

  describe "successful creation users#create" do
    context "no admins" do
      before do
        visit new_group_path
        fill_in :group_name, with: "ANiceGroupName"
      end
      specify { expect{click_button("Make group")}.to change(Group,:count).by 1 }
      it 'should show an alert' do
        click_button("Make group")
        expect(page).to have_css("div.alert.alert-success", text: "Group created. foobar granted administrative powers")
      end
    end

    context "with admins" do
      context "that are not users" do
        before do
          visit new_group_path
          fill_in :group_name, with: "ANiceGroupName"
          fill_in :group_admins, with: "Some_guy some_other_guy, and_another_guy"
          click_button "Make group"
        end
        it { should have_content "Some_guy, some_other_guy and and_another_guy are not LMG members" }
      end

      context "that are valid users" do
        before do
          visit new_group_path
          fill_in :group_name, with: "ANiceGroupName"
          fill_in :group_admins, with: "#{another_user.name}, #{a_third_user.name} #{fourth_user.name}"
          click_button "Make group"
        end

        it { should have_content "Admins successfully added: #{another_user.name}, #{a_third_user.name} and #{fourth_user.name}" }
      end

      context "a mixture of valid and invalid users" do
        before do
          visit new_group_path
          fill_in :group_name, with: "ANiceGroupName"
          fill_in :group_admins, with: "#{another_user.name}, not_a_user, #{a_third_user.name} #{fourth_user.name} not_a_user_2 "
          click_button "Make group"
        end

        it { should have_content "Administrative powers given to #{another_user.name}, #{a_third_user.name} and #{fourth_user.name}"}
        it { should have_content "not_a_user and not_a_user_2 are not LMG members" }
        it { should have_content "Group created." }

      end

    end

  end

end



















