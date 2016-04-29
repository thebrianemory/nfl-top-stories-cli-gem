class Story
  attr_accessor :title, :author, :posted, :body

  def self.keep_reading(source)
    puts ""
    puts "Would you like to read more stories?"
    input = gets.strip.downcase
    if input == "yes" || input == "y"
      case source.to_s
      when "espn"
        Headline.espn_choice
      when "nfl"
        Headline.nfl_choice
      end
    else
      CLI.new.goodbye
    end
  end

  def self.display_story(source)
    puts <<~DOC
    \033[1;34m#{@story.title}\033[0m
    \033[0;31mStory #{@story.author}\033[0m
    DOC
      @new_stories[0,5].each do |para|
        puts <<~DOC
        #{para}\n
        DOC
      end
    puts <<~DOC
    Read the rest of the story at \033[4;35m#{@url}\033[0m
    DOC
    self.keep_reading(source)
  end

  def self.espn_stories(url)
    doc = Nokogiri::HTML(open(url))
    new_doc = doc.at("aside").remove
    @url = url
    @story = self.new
    @story.title = doc.search("header.article-header h1").text
    @story.author = "by " + doc.search("div.author span").text
    @story.body = doc.search("div.article-body p")
    @new_stories = []
    @story.body.each do |x|
      @new_stories << x.text unless x.text == ""
    end
    self.display_story("espn")
  end

  def self.nfl_stories(url)
    doc = Nokogiri::HTML(open(url))
    @url = url
    @story = self.new
    @story.title = doc.search("div#article-hdr h1").text
    @story.author = doc.search("li#article-hdr-meta-author").text.strip
    @story.body = doc.search("div.articleText p")
    @new_stories = []
    @story.body.each do |x|
      if x.content.strip.empty?
        x.remove
      else
        @new_stories << x.text
      end
    end
    self.display_story("nfl")
  end
end
