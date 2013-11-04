FactoryGirl.define do
	factory :user do
		name	 "John"
		email	 "john@woofound.com"
		password "foobar"
		password_confirmation "foobar"
	end
end