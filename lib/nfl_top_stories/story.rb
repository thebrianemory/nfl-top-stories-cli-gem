class Story
  attr_accessor :title, :author, :posted, :body

  def self.keep_reading(source)
    puts ""
    puts "Would you like to read more stories?"
    input = gets.strip.downcase
    if input == "yes" || input == "y"
      case source.to_s
      when "espn"
        Headline.get_choice("espn")
      when "nfl"
        Headline.get_choice("nfl")
      when "cbs"
        Headline.get_choice("cbs")
      when "fox"
        Headline.get_choice("fox")
      when "usa"
        Headline.get_choice("usa")
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

  ## ------------------- ESPN Stories ------------------- ##
  def self.espn_stories(url)
    doc = Nokogiri::HTML(open(url))
    doc.search("aside").remove
    @url = url
    @story = self.new
    @story.title = doc.search("header.article-header h1").text
    @story.author = "By " + doc.search("div.author span").text
    @story.body = doc.search("div.article-body p")
    @new_stories = []
    @story.body.each do |x|
      @new_stories << x.text unless x.text == ""
    end
    self.display_story("espn")
  end

  ## ------------------- NFL.com Stories ------------------- ##
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

  ## ------------------- CBS Sports Stories ------------------- ##
  def self.cbs_stories(url)
    doc = Nokogiri::HTML(open(url))
    @url = url
    @story = self.new
    @story.title = doc.search("div#storyContent h1").text
    @story.author = "By " + doc.search("span.name").text
    @story.body = doc.search("div.storyCopy p")
    @new_stories = []
    @story.body.each do |x|
      @new_stories << x.text unless x.text == ""
    end
    self.display_story("cbs")
  end

  ## ------------------- Fox Sports Stories ------------------- ##
  def self.fox_stories(url)
    doc = Nokogiri::HTML(open(url))
    @url = url
    @story = self.new
    @story.title = doc.search("h1.story-headline").text
    @story.author = doc.search("span.byline-name").text
    @story.body = doc.search("div.story-body p")
    @new_stories = []
    @story.body.each do |x|
      if x.content.strip.empty?
        x.remove
      else
        @new_stories << x.text
      end
    end
    self.display_story("fox")
  end

  ## ------------------- USA Today Stories ------------------- ##
  def self.usa_stories(url)
    doc = Nokogiri::HTML(open(url))
    doc.search("video").remove
    doc.search("aside").remove
    doc.search("p.video-desc").remove
    doc.search("p.pluto-share-overlay-title").remove
    doc.search("p.pluto-embed-overlay-title").remove
    doc.search("p.oembed-link-title").remove
    doc.search("p.oembed-link-desc").remove
    @url = url
    @story = self.new
    @story.title = doc.search("h1.asset-headline").text
    @story.author = "By " + doc.search("span.asset-metabar-author").text.strip
    @story.body = doc.search("div.asset-double-wide p")
    @new_stories = []
    @story.body.each do |x|
      if x.content.strip.empty?
        x.remove
      else
        @new_stories << x.text
      end
    end
    self.display_story("usa")
  end
end
