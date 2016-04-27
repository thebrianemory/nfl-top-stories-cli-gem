class Headline

  @all_stories = ["0. Back to the main menu"]

  def self.espn_headlines
    puts ""
    puts "\033[0;36mWhich story would you like to read?\033[0m"
    puts "0. Back to the main menu"
    Story.espn_stories.each.with_index(1) do |story, i|
      puts "#{i}. #{story.headline}"
      @all_stories << story
    end
    self.user_choice
  end

  def self.user_choice
    input = gets.strip.downcase
    puts ""
    if input == "0"
      CLI.new.call
    elsif input == "1"
      puts <<~DOC.gsub /^\s*/, ''
        \033[1;35m#{@all_stories[1].title}\033[0m
        \033[0;31mPosted by #{@all_stories[1].author} on #{@all_stories[1].posted}\033[0m
        #{@all_stories[1].body}
      DOC
      self.espn_headlines
    elsif input == "2"
      puts <<~DOC.gsub /^\s*/, ''
        \033[1;35m#{@all_stories[2].title}\033[0m
        \033[0;31mPosted by #{@all_stories[2].author} on #{@all_stories[2].posted}\033[0m
        #{@all_stories[2].body}
      DOC
      self.espn_headlines
    else
      puts "\033[1;33mInvalid Entry -- Please try again\033[0m"
      self.espn_headlines
    end
  end
end
