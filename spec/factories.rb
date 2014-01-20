FactoryGirl.define do
  factory :user do
    name "foobar"
    email "foo@bar.com"
    password "foobar"
    password_confirmation "foobar"
  end
  factory :another_user, class: 'User' do
    name "kungfoobar"
    email "baz@quux.com"
    password "foobar"
    password_confirmation "foobar"
  end
  factory :a_third_user, class: 'User' do
    name "chocolatefoobar"
    email "b@z.com"
    password "foobar"
    password_confirmation "foobar"
  end

  factory :fourth_user, class: 'User' do
    name "fooareyoubar"
    email "b@f.com"
    password "bazquux"
    password_confirmation "bazquux"
  end
end