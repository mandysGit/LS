require "tilt/erubis"
require "sinatra"
require "sinatra/reloader" if development?

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
    results << [title, idx + 1, match_paragraphs(chapter)] if chapter.match?(params[:query])
  end

  results
end

def match_paragraphs(chapter)
  hsh = {}
  chapter.split("\n\n").each_with_index do |paragraph, idx| 
    hsh[idx] = paragraph
  end

  hsh.select { |_, paragraph| paragraph.match?(params[:query]) }
end

helpers do
  def in_paragraphs(text)
    text.split("\n\n")
        .map.with_index { |paragraph, idx| "<p id=paragraph#{idx}>#{paragraph}</p>" }
        .join
  end

  def bold_match(paragraph, pattern)
    paragraph.gsub(pattern, "<strong>#{pattern}</strong>")
  end
end

not_found do
  redirect "/"
end

