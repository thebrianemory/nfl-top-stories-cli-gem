class Story
  attr_accessor :title, :author, :posted, :body

  def self.espn_stories(url)
    # Take in URL from headline and scrap
    # Return the title, author, date poasted, and body
    doc = Nokogiri::HTML(open(url))

    story = self.new
    story.title = "test title"
    story.author = "test author"
    story.posted = "test posted"
    story.body = "test body"

    # binding.pry
    puts <<~DOC
    \033[1;35m#{story.title}\033[0m
    \033[0;31mPosted by #{story.author} on #{story.posted}\033[0m
    #{story.body}
    DOC
  end

  def self.nfl_stories
    puts <<~DOC
      1. Rams mediocre for yet another year
      2. Russell to star in Waterboy 2
      3. Draft picks most likely all terrible
      4. Rodgers is a better QB than Alex Smith
      5. Vikings draft WR, can't catch footballs
    DOC
  end
end
