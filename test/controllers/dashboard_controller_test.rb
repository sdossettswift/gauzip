require "test_helper"

describe DashboardController do
  it "should get welcome" do
    get dashboard_welcome_url
    value(response).must_be :success?
  end

end
