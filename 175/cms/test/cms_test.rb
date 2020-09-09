ENV["RACK_ENV"] = "test"

require "minitest/autorun"
require "rack/test"

require_relative "../cms"

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_index
    get "/"
    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "about.md"
    assert_includes last_response.body, "changes.txt"
    assert_includes last_response.body, "history.txt"
  end

  def test_file
    get "/history.txt"
    assert_equal 200, last_response.status
    assert_equal "text/plain", last_response["Content-Type"]
    assert_includes last_response.body, "1993 - Yukihiro Matsumoto dreams up Ruby."
  end

  def test_document_not_found
    get "/non_existent.txt"
    assert_equal 302, last_response.status # Assert user was redircted

    get last_response["Location"] # Request page that user was redirected to
    assert_equal 200, last_response.status
    assert_includes last_response.body, "non_existent.txt does not exist."

    get "/" # Reload the page
    refute_includes last_response.body, "non_existent.txt does not exist."
  end

  def test_render_markdown
    get "/about.md"

    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "<h2>Ruby is...</h2>"
  end

  def test_render_edit
    get "/changes.txt/edit"

    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "<label>Edit content of changes.txt:</label>"
    assert_includes last_response.body, %q(<button type="submit")
  end

  def test_edit_file
    post "/changes.txt/edit", content: "new content"

    assert_equal 302, last_response.status # Assert user was redircted
    
    get last_response["Location"]

    assert_includes last_response.body, "changes.txt has been updated"
    get "/changes.txt"
    assert_equal 200, last_response.status
    assert_includes last_response.body, "new content"
  end
end

