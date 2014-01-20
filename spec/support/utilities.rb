include ApplicationHelper

def sign_in user
  visit signin_path
  fill_in "Name",    with: user.name
  fill_in "Password", with: user.password
  click_button "Enter"
end

def sign_out
  click_link "Sign Out"
end

def full_title page_title
  base_title = "LetMeGolf"
  if page_title.empty?
    base_title
  else
    "#{base_title} ~ #{page_title}"
  end
end

