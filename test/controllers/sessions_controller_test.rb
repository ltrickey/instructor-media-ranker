require "test_helper"

describe SessionsController do
  describe "login_form" do
    # The login form is a static page - no real way to make it fail
    it "redirects to github to login" do
      get "/auth/github"
      must_respond_with :redirect
    end
  end

  describe "logout" do
    it "succeeds if the user is logged in" do
      # Gotta be logged in first
      get "/auth/github", params: { username: "test user" }
      must_redirect_to root_path

      post logout_path
      must_redirect_to root_path
    end

    it "succeeds if the user is not logged in" do
      post logout_path
      must_redirect_to root_path
    end
  end

  # describe "login" do
  #   # This functionality is complex!
  #   # There are definitely interesting cases I haven't covered
  #   # here, but these are the cases I could think of that are
  #   # likely to occur. More test cases will be added as bugs
  #   # are uncovered.
  #   #
  #   # Note also: some more behavior is covered in the upvote tests
  #   # under the works controller, since that's the only place
  #   # where there's an interesting difference between a logged-in
  #   # and not-logged-in user.
  #   it "succeeds for a new user" do
  #     username = "test_user"
  #     # Precondition: no user with this username exists
  #     User.find_by(username: username).must_be_nil
  #
  #     get "/auth/github", params: { username: username }
  #     must_redirect_to root_path
  #   end
  #
  #   it "succeeds for a returning user" do
  #     username = User.first.username
  #     get "/auth/github", params: { username: username }
  #     must_redirect_to root_path
  #   end
  #
  #   it "renders 400 bad_request if the username is blank" do
  #     get "/auth/github", params: { username: "" }
  #     must_respond_with :bad_request
  #   end
  #
  #   #unsure if this actually will work with current way we have it working
  #   it "succeeds if a different user is already logged in" do
  #     username = "user_1"
  #     get "/auth/github", params: { username: username }
  #     must_redirect_to root_path
  #
  #     username = "user_2"
  #     get "/auth/github", params: { username: username }
  #     must_redirect_to root_path
  #   end
  # end


end
