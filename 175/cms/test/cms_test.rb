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

    get last_response["Location"] # Request page that user was redirected
    assert_equal 200, last_response.status
    assert_includes last_response.body, "non_existent.txt does not exist."

    get "/" # Reload the page
    refute_includes last_response.body, "non_existent.txt does not exist."
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
    
    get last_response["Location"]

    assert_includes last_response.body, "changes.txt has been updated"
    get "/changes.txt"
    assert_equal 200, last_response.status
    assert_includes last_response.body, "new content"
  end
end

