class Headline
  attr_accessor :title, :url

## ------------------- ESPN Headlines ------------------- ##
  def self.espn_headlines
    @espn_headlines = []
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
      @espn_headlines << espn_headline
      i += 1
    end
  end

  def self.espn_choice
    puts ""
    puts "\033[0;36mWhich story would you like to read?\033[0m"
    puts "0. Back to the main menu"
    @espn_headlines.each.with_index(1) do |headline, i|
      puts "#{i}. #{headline.title}"
    end
    input = gets.strip.downcase
    if input == "0"
      puts ""
      CLI.new.call
    elsif input == "1"
      Story.espn_stories(@espn_headlines[0].url)
    elsif input == "2"
      Story.espn_stories(@espn_headlines[1].url)
    elsif input == "3"
    Story.espn_stories(@espn_headlines[2].url)
    elsif input == "4"
    Story.espn_stories(@espn_headlines[3].url)
    elsif input == "5"
    Story.espn_stories(@espn_headlines[4].url)
    elsif input == "6"
    Story.espn_stories(@espn_headlines[5].url)
    else
      puts "Invalid entry..."
      self.espn_choice
    end
  end

  ## ------------------- NFL.com Headlines ------------------- ##
  def self.nfl_headlines
    @nfl_headlines = []
    self.scrape_nfl
    self.nfl_choice
  end

  def self.scrape_nfl
    main_url = "http://www.nfl.com"
    doc = Nokogiri::HTML(open("http://www.nfl.com/news"))

    i = 0
    while i < 10
      nfl_headline = self.new
      nfl_headline.title = doc.search("div#headlines-latest li a")[i].text
      nfl_headline.url = main_url +  doc.search("div#headlines-latest li a")[i].attributes["href"].value
      @nfl_headlines << nfl_headline
      i += 1
    end
  end

  def self.nfl_choice
    puts ""
    puts "\033[0;36mWhich story would you like to read?\033[0m"
    puts "0. Back to the main menu"
    @nfl_headlines.each.with_index(1) do |headline, i|
      puts "#{i}. #{headline.title}"
    end
    input = gets.strip.downcase
    if input == "0"
      puts ""
      CLI.new.call
    elsif input == "1"
      Story.nfl_stories(@nfl_headlines[0].url)
    elsif input == "2"
      Story.nfl_stories(@nfl_headlines[1].url)
    elsif input == "3"
      Story.nfl_stories(@nfl_headlines[2].url)
    elsif input == "4"
      Story.nfl_stories(@nfl_headlines[3].url)
    elsif input == "5"
      Story.nfl_stories(@nfl_headlines[4].url)
    elsif input == "6"
      Story.nfl_stories(@nfl_headlines[5].url)
    elsif input == "7"
      Story.nfl_stories(@nfl_headlines[6].url)
    elsif input == "8"
      Story.nfl_stories(@nfl_headlines[7].url)
    elsif input == "9"
      Story.nfl_stories(@nfl_headlines[8].url)
    elsif input == "10"
      Story.nfl_stories(@nfl_headlines[9].url)
    else
      puts "Invalid entry..."
      self.nfl_choice
    end
  end
end
