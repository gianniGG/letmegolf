FactoryGirl.define do
  factory :user do
    name     "TomShacham"
    email    "shachamtom@gmail.com"
    password "foobar"
    password_confirmation "foobar"
  end
end