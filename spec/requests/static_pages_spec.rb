require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_title(full_title("Home")) }
    it { should have_content("Welcome") }
    it { should_not have_link("Multiplayer") }
    it { should_not have_link("Social") }
    it { should_not have_link("Account") }

  end

  describe "Single Play for non-signed up user" do
    before { visit singleplay_path }

    it { should have_title(full_title("Singleplay")) }
    it { should have_link "Sign up" }
    it { should_not have_link "Multiplayer" }
    it { should have_content "Single Play" }
  end

end