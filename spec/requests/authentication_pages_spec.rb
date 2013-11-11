require 'spec_helper'
include Capybara::DSL

describe "Authentication" do

  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { should have_content('Sign in') }
    it { should have_title('Sign in') }
  end

  describe "signin" do
  	before { visit signin_path }

  	describe "with valid information" do
  		before { click_button "Sign in" }

  		it { should have_title('Sign in') }
  		it { should have_selector('div.alert.alert-error', text: 'Invalid') }

  		describe "after visiting another page" do
  			before { click_button "Home" }
  			it { should_not have_selector('div.alert.alert-error') }
  		end

      describe "followed by signout" do
        before { click_link "Sign out" }
        it { should have_link('Sign in') }
      end

  	end
  end
end

# describe "AuthenticationPages" do
#   describe "GET /authentication_pages" do
#     it "works! (now write some real specs)" do
#       # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
#       get authentication_pages_index_path
#       response.status.should be(200)
#     end
#   end
# end
