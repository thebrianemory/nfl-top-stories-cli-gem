class Story
  attr_accessor :title, :author, :posted, :body

  def self.espn_stories(url)
    doc = Nokogiri::HTML(open(url))
    new_doc = doc.at("aside").remove
    story = self.new
    story.title = doc.search("header.article-header h1").text
    story.author = doc.search("div.author span").text
    story.body = doc.css("div.article-body p")
    new_stories = []
    story.body.each do |x|
      new_stories << x.text unless x.text == ""
    end

    puts <<~DOC
    \033[1;34m#{story.title}\033[0m
    \033[0;31mStory by #{story.author}\033[0m
    DOC
      new_stories[0,5].each do |para|
        puts <<~DOC
        #{para}\n
        DOC
      end
    puts <<~DOC
    Read the rest of the story at \033[4;35m#{url}\033[0m
    DOC
  end

  def self.nfl_stories
  end
end
