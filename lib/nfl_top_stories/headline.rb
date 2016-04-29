class Headline
  attr_accessor :title, :url
  extend HeadlineChoice

  @headlines = []

  ## ------------------- ESPN Headlines ------------------- ##
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

  ## ------------------- NFL.com Headlines ------------------- ##
  def self.scrape_nfl
    main_url = "http://www.nfl.com"
    doc = Nokogiri::HTML(open("http://www.nfl.com/news"))

    i = 0
    while i < 6
      nfl_headline = self.new
      nfl_headline.title = doc.search("div#headlines-latest li a")[i].text
      nfl_headline.url = main_url +  doc.search("div#headlines-latest li a")[i].attributes["href"].value
      @headlines << nfl_headline
      i += 1
    end
  end

  ## ------------------- CBS Sports Headlines ------------------- ##
  def self.scrape_cbs
    main_url = "http://www.cbssports.com"
    doc = Nokogiri::HTML(open("http://www.cbssports.com/nfl"))

    i = 0
    while i < 6
      cbs_headline = self.new
      cbs_headline.title = doc.search("ul#homeArenaHeadlines span")[i].text
      cbs_headline.url = doc.search("ul#homeArenaHeadlines a")[i].attributes["href"].value
      @headlines << cbs_headline
      i += 1
    end
  end

  ## ------------------- Fox Sports Headlines ------------------- ##
  def self.scrape_fox
    main_url = "http://www.foxsports.com"
    doc = Nokogiri::HTML(open("http://www.foxsports.com/nfl"))

    i = 0
    while i < 6
      fox_headline = self.new
      fox_headline.title = doc.search("h3.buzzer-title")[i].text
      fox_headline.url = doc.search("div.buzzer-header a")[i].attributes["href"].value
      @headlines << fox_headline
      i += 1
    end
  end

  ## ------------------- USA Today Headlines ------------------- ##
  def self.scrape_usa
    main_url = "http://www.usatoday.com"
    doc = Nokogiri::HTML(open("http://www.usatoday.com/sports/nfl"))

    i = 0
    while i < 6
      usa_headline = self.new
      usa_headline.title = doc.search("li span.js-asset-headline")[i].text
      usa_headline.url = main_url + doc.search("li a.js-asset-link")[i].attributes["href"].value
      @headlines << usa_headline
      i += 1
    end
  end

end
