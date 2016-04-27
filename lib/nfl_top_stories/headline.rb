class Headline
  attr_accessor :title, :url

  # @all_stories = ["0. Back to the main menu"]
  #
  # def self.espn_headlines
  #   @espn_headline_scrape = ["0. Back to the main menu"]
  #   puts ""
  #   puts "\033[0;36mWhich story would you like to read?\033[0m"
  #   puts "0. Back to the main menu"
  #   Story.espn_stories.each.with_index(1) do |story, i|
  #     puts "#{i}. #{story.headline}"
  #     @espn_headline_scrape << story
  #   end
  #   self.espn_choice
  # end

  def self.espn_headlines
    @headlines = []

    self.scrape_espn

    self.espn_choice
  end

  def self.scrape_espn
    main_url = "http://espn.go.com"
    doc = Nokogiri::HTML(open("http://espn.go.com/nfl/"))

    i = 0
    while i < 6
      espn_headline = self.new
      espn_headline.title = doc.search("div.headlines ul li a")[i].text
      espn_headline.url = main_url +  doc.search("div.headlines ul li a")[i].attributes["href"].value
      @headlines << espn_headline
      i += 1
    end
  end

  def self.espn_choice
    puts ""
    puts "\033[0;36mWhich story would you like to read?\033[0m"
    puts "0. Back to the main menu"
    @headlines.each.with_index(1) do |headline, i|
      puts "#{i}. #{headline.title}"
    end
    input = gets.strip.downcase
    if input == "0"
      CLI.new.call
    elsif input == "1"
      Story.espn_stories(@headlines[0].url)
    end
  end
end
