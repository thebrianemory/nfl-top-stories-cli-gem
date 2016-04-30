class CLI

  def call
    puts ""
    puts "Welcome to NFL Top Stories!"
    puts "View the top headlines from the following sites:"
    puts ""
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
    puts "Enter the number for the site you want to see headlines from.\nYou can also type list to display sites or exit to cancel."
    input = gets.strip.downcase
    if input == "1"
      Headline.get_headlines("espn")
    elsif input == "2"
      Headline.get_headlines("nfl")
    elsif input == "3"
      Headline.get_headlines("cbs")
    elsif input == "4"
      Headline.get_headlines("fox")
    elsif input == "5"
      Headline.get_headlines("usa")
    elsif input == "list"
      list_stories
    elsif input == "exit"
      goodbye
    else
      puts "\033[0;33mInvalid entry...\033[0m"
      menu
    end
  end

  def goodbye
    puts "\033[0;33mSee you next time!\033[0m"
  end
end
