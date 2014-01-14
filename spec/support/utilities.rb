include ApplicationHelper

def valid_signin(user)
  fill_in "name", with: user.name
  fill_in "password", with: user.password
  click_button "commit"
end

RSpec::Matchers.define :have_alert do |message|
  match do |page|
    expect(page).to have_selector('.alert', text: message )
  end
end

def full_title(extension)
  base_title = "LetMeGolf"
  if extension.empty?
    full_title = base_title
  else
    return "#{base_title} ~ #{extension}"
  end
end