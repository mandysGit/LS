ENV["RACK_ENV"] = "test"

require "minitest/autorun"
require "rack/test"
require "fileutils"
require_relative "../cms"

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end
  
  def create_document(name, content = "")
    File.open(File.join(data_path, name), "w") do |file|
      file.write(content)
    end
  end

  def session
    last_request.env["rack.session"]
  end

  def setup
    FileUtils.mkdir_p(data_path)
  end

  def teardown
    FileUtils.rm_rf(data_path)
  end

  def test_index
    create_document "about.md"
    create_document "changes.txt"

    get "/"
    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "about.md"
    assert_includes last_response.body, "changes.txt"
  end

  def test_file
    create_document "history.txt", "This is a history file."

    get "/history.txt"
    assert_equal 200, last_response.status
    assert_equal "text/plain", last_response["Content-Type"]
    assert_includes last_response.body, "This is a history file."
  end

  def test_document_not_found
    get "/non_existent.txt"
    assert_equal 302, last_response.status # Assert user was redircted

    assert_equal "non_existent.txt does not exist.", session[:message]
  end

  def test_render_markdown
    create_document "about.md", "## Ruby is..."
    get "/about.md"

    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "<h2>Ruby is...</h2>"
  end

  def test_render_edit
    create_document "changes.txt"
    get "/changes.txt/edit"

    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "<label>Edit content of changes.txt:</label>"
    assert_includes last_response.body, %q(<button type="submit")
  end

  def test_edit_file
    post "/changes.txt/edit", content: "new content"

    assert_equal 302, last_response.status # Assert user was redircted
    assert_equal "changes.txt has been updated.", session[:message]

    get "/changes.txt"
    assert_equal 200, last_response.status
    assert_includes last_response.body, "new content"
  end

  def test_new
    get "/new"

    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "Add a new Document:"
    assert_includes last_response.body, %q(<button type="submit")
  end

  def test_create_new_document
    post "/new/create", new_file: "test.txt"

    assert_equal 302, last_response.status 
    assert_equal "test.txt was created.", session[:message]

    get "/"
    assert_includes last_response.body, "test.txt"
  end

  def test_create_new_document_without_filename
    post "/new/create", new_file: ""
    assert_equal 422, last_response.status
    assert_includes last_response.body, "A name is required."
  end

  def test_create_new_document_without_extension
    post "/new/create", new_file: "test"
    assert_equal 422, last_response.status
    assert_includes last_response.body, "A valid file extension is required."
  end

  def test_delete_document
    create_document "delete_this.txt"

    post "/delete_this.txt/delete"
    assert_equal 302, last_response.status
    assert_equal "delete_this.txt has been deleted.", session[:message]

    get "/"
    refute_includes last_response.body, %q(href="delete_this.txt")
  end

  def test_render_signin
    get "/"
    assert_equal 200, last_response.status
    assert_includes last_response.body, "Sign In"

    get "users/signin"
    assert_equal 200, last_response.status
    assert_includes last_response.body, "Username:"
    assert_includes last_response.body, "Password:"
    assert_includes last_response.body, %q(<button type="submit")
  end

  def test_signin_valid_credentials
    post "/users/signin", username: "admin", password: "secret"
    assert_equal 302, last_response.status
    assert_equal "Welcome!", session[:message]
    assert_equal "admin", session[:username]
    
    get last_response["Location"]
    assert_includes last_response.body, "Signed in as admin"
  end

  def test_signin_invalid_credentials
    post "/users/signin", username: "guest", password: "random"
    assert_equal 422, last_response.status
    assert_nil session[:username]
    assert_includes last_response.body, "Invalid Credentials"
  end

  def test_signout
    get "/", {}, { "rack.session" => { username: "admin" } }
    assert_includes last_response.body, "Signed in as admin"

    post "/users/signout"
    assert_equal "You have been signed out.", session[:message]

    get last_response["Location"]
    assert_nil session[:username]
    assert_includes last_response.body, "Sign In"
  end
end

