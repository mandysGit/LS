require "tilt/erubis"
require "sinatra"
require "sinatra/reloader"

before do 
  @contents = File.readlines("data/toc.txt")
end

get "/" do
  @title = "The Adventures of Sherlock Holmes"
  erb :home
end

get "/chapters/:number" do
  number = params[:number].to_i
  chapter_name = @contents[number - 1]
  redirect "/" unless (1..@contents.size).cover? number

  @title = "Chapter #{number} : #{chapter_name}"
  @chapter = File.read("data/chp#{number}.txt")

  erb :chapter
end

get "/search" do
  @result = match_chapters(params[:query])

  erb :search
end

def match_chapters(query)
  results = [] 

  return results if !query || query.empty?

  @contents.each.with_index do |title, idx|
    chapter = File.read("data/chp#{idx + 1}.txt")
    results << [title, idx + 1] if chapter.match?(params[:query])
  end

  results
end

helpers do
  def in_paragraphs(text)
    text.split("\n\n")
        .map { |paragraph| "<p>#{paragraph}</p>" }
        .join
  end
end

not_found do
  redirect "/"
end

