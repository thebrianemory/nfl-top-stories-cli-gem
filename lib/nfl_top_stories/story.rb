class Story
  attr_accessor :headline, :url, :title, :author, :posted, :body

  def self.espn_stories
    story_1 = self.new
    story_1.headline = "Breese takes aim at Goodell after Brady ruling"
    story_1.url = "http://espn.go.com/nfl/story/_/id/15388393/drew-brees-new-orleans-saints-takes-aim-roger-goodell-tom-brady-ruling"
    story_1.title = "Drew Brees: Roger Goodell has too much power"
    story_1.author = "Mike Triplett"
    story_1.posted = "5:33 PM ET"
    story_1.body = 'Drew Brees took aim at the disciplinary power of NFL commissioner Roger Goodell on Tuesday when asked for his reaction to the league\'s Deflategate penalties against Tom Brady being reinstated by a federal appeals court.

    The New Orleans Saints quarterback said Goodell\'s ability to serve as "judge, jury and executioner" has been a "black eye" for the NFL.

    "I think we would all agree that he definitely has too much power," Brees told SI.com. "He is judge, jury and executioner when it comes to all the discipline. I\'m not going to trust any league-led investigation when it comes to anything. It\'s not transparent."'

    story_2 = self.new
    story_2.headline = "Agent: Bradford blindsided by Eagles' decisions"
    story_2.url = "http://espn.go.com/nfl/story/_/id/15388458/agent-sam-bradford-says-philadelphia-eagles-decision-trade-pick-quarterback-came-surprise"
    story_2.title = "Sam Bradford's agent: 'Would be nice' if Eagles shared draft plan"
    story_2.author = "Sal Paolantonio"
    story_2.posted = "5:35 PM ET"
    story_2.body =
    'Sam Bradford\'s agent, Tom Condon, told ESPN on Tuesday that the Philadelphia Eagles did not tell Bradford they had a plan to draft a quarterback high in the first round, to relinquish so many valuable draft picks in a mega-trade to move up to No. 2 and essentially make Bradford a lame duck starter.

    "As they were making this plan, it would have been nice if they had told him about it," said Condon, who said that he re-iterated to Eagles vice president of football operations Howie Roseman in a recent phone conversation that Bradford wants out of Philadelphia.

    "It\'s his right to demand a trade and he wants to be traded," said Condon.

    Condon said when he told Roseman of Bradford\'s demand, Roseman "was not too surprised. He knew how Sam felt. Sam made it very clear to them, he was adamant when they informed him last week about the trade up to No. 2. He told them he was not very happy about it. He made that very clear. So this [trade demand] comes as no surprise."

    "Basically, our contention is that the team could have used the draft picks on offensive and defensive players for this season, to win this season," said Condon. "If the plan was to build for the future, where does that leave Sam this year?"

    Condon said he asked the Eagles for permission to shop Bradford, but that permission was denied.

    Condon said he has informed the team that Bradford will not show up at the Eagles practice facility until June 7, the first day of mandatory mini-camp. He said that Bradford feels it will be difficult for him to return to the Eagles as a lame duck.

    He said he hopes the Eagles "realize the best way for this to resolve itself is to try to get something in return for Sam now in a trade," instead of waiting until 2017, when the team apparently will try to shop Bradford after the rookie quarterback, presumably Carson Wentz, is installed as the team\'s starting quarterback.'
    [story_1, story_2]
  end

  def self.nfl_stories
    puts <<~DOC
      1. Rams
      2. Russell
      3. Draft
      4. Rodgers
      5. Vikings
    DOC
  end
end
