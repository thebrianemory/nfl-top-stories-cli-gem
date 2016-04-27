class CLI

  def call
    list_stories

  end

  def list_stories
    puts <<~DOC
      1. ESPN.com
      2. NFL.com
      3. CBSSports.com
      4. FoxSports.com
      5. USAToday.com
    DOC
    menu
  end

  def menu
    puts "Enter the number for the site you want to see headlines from.\n You can also type list to display sites or exit to cancel."
    input = gets.strip.downcase
    if input == "1"
      Headline.espn_headlines
    elsif input == "2"
      Story.nfl_stories
    elsif input == "3"
      puts "Lists stories from CBS Sports"
    elsif input == "4"
      puts "Lists stories from Fox Sports"
    elsif input == "5"
      puts "Lists stories from USA Today"
    elsif input == "list"
      list_stories
    elsif input == "exit"
      goodbye
    else
      puts "Not sure what you want, type list or exit"
    end
  end

  def goodbye
    puts "See you next time!"
  end
end