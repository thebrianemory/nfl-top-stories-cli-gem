module HeadlineChoice

  def get_headlines(source)
    case source.to_s
    when "espn"
      @headlines = []
      self.scrape_espn
      get_choice("espn")
    when "nfl"
      @headlines = []
      self.scrape_nfl
      get_choice("nfl")
    when "cbs"
      @headlines = []
      self.scrape_cbs
      get_choice("cbs")
    when "fox"
      @headlines = []
      self.scrape_fox
      get_choice("fox")
    when "usa"
      @headlines = []
      self.scrape_usa
      get_choice("usa")
    end
  end

  def get_choice(source)
    puts ""
    puts "\033[0;36mWhich story would you like to read?\033[0m"
    puts "0. Back to the main menu"
    @headlines.each.with_index(1) do |headline, i|
      puts "#{i}. #{headline.title}"
    end

    case source
    when "espn"
      get_source = "espn_stories"
    when "nfl"
      get_source = "nfl_stories"
    when "cbs"
      get_source = "cbs_stories"
    when "fox"
      get_source = "fox_stories"
    when "usa"
      get_source = "usa_stories"
    end

    input = gets.strip.downcase
    if input == "0"
      puts ""
      CLI.new.call
    elsif input == "1"
      Story.send(get_source, @headlines[0].url)
    elsif input == "2"
      Story.send(get_source, @headlines[1].url)
    elsif input == "3"
      Story.send(get_source, @headlines[2].url)
    elsif input == "4"
      Story.send(get_source, @headlines[3].url)
    elsif input == "5"
      Story.send(get_source, @headlines[4].url)
    elsif input == "6"
      Story.send(get_source, @headlines[5].url)
    else
      puts "\033[0;33mInvalid entry...\033[0m"
      get_choice(source)
    end
  end
end
