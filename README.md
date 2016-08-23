# README

Let's clone twitter!

Objectives
Learning Objectives

After completing this assignment, you should…

    Understand gems and their place in Rails development
    Understand Feature tests and their place in Rails development
    Understand Relationships between models
    Understand Personalization
    Understand Authentication
    Understand Pagination

Performance Objectives

After completing this assignment, you be able to effectively use

    authentication, sessions, and current_user
    bootstrap-sass
    acts_as_follower
    Validations
    Controllers
    Capybara and MiniTest

Details
Deliverables

    A repo containing at least:
        a user model
        a post model that users can write
        two feature tests
    A link to the live Heroku site
    A link to the TravisCI instance running feature tests

Requirements
Normal Mode

    Users can signup, and sign in
    User can follow other users
    User can see posts from [User + Friends] in their Timeline
    User can Post posts
    User can unfollow a person
    Site should look nice
    Data should be seeded (use faker)
    Get live and up and working on Heroku
    Site is setup with TravisCI.org with running Feature tests
    TravisCI deploys to Heroku, not you :)

Feature Tests:

    User can signup
    User can signin and then see timeline
    User can signin, follow a user, and then see their posts

Difficult Mode

    User can view a profile (/jwo)
    Users can block users for being a-holes
    Users can search for posts
    Users can upload a photo of themselves
    Users can add a photo to a post

Epic Mode

    Use test-driven-development to write tests before all production code

Notes

    When logged in, the root URL should show the messages from all the people you follow.
    People can post "messages," "cheeps," or whatever you want to call them. They're tweets, but please don't call them that.
    Getting the list of messages for You + people you follow is tricky'ish. Think of it like this:

Sample Code:

class User
  def timeline
    follower_ids = following_users.pluck(:id)
    all_ids = follower_ids << user.id
    Post.where(user_id: all_ids).order("created_at DESC")
  end
end

Additional Resources
