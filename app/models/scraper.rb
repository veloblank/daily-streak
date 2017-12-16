class Scraper

  ESPN = "http://streak.espn.com/en/"
  LEADERBOARD = "http://streak.espn.com/en/leaderboard?lbType=winningStreaks"
  @@lb_streaks = []
  @@scraped_props = []
  #@@props = []

  def self.scrape_page
    @doc = Nokogiri::HTML(open(ESPN))
    @doc.css("div .matchup-container")
  end

  def self.scrape_leaderboard
    Nokogiri::HTML(open(LEADERBOARD))
  end

  def self.scrape_props
    scrape_page.each_with_index do |p, index|
      prop = {
        prop_id_num: index + 1,
        event_title: p.css(".gamequestion").text,
        start_time: p.css("div .startTime").text,
        sport: p.css(".sport-description").text,
        away_team: p.css("td span strong")[0].text,
        home_team: "@" + p.css("td span strong")[1].text,
        prop_preview: p.css("div.matchupStatus a").attr("href").value,

        #if prop is in progress, method error for css method error avoided
        away_team_url: p.css(".matchupStatus").text == "Preview" || p.css(".matchupStatus").text == "Not Started" ? "http://streak.espn.com/en/" + p.css("td a#matchupDiv.mg-check.mg-checkEmpty.requireLogin")[0].attr("href") : "http://streak.espn.com/en/",
        home_team_url: p.css(".matchupStatus").text == "Preview" || p.css(".matchupStatus").text == "Not Started" ? "http://streak.espn.com/en/" + p.css("td a#matchupDiv.mg-check.mg-checkEmpty.requireLogin")[1].attr("href") : "http://streak.espn.com/en/",
        matchup_status: p.css(".matchupStatus").text
      }

        # CSS issue if one or both of opponents are ranked (i.e "#20 Auburn" steals one of the 'strong' tags and won't properly seed prop opponents from array
        if p.css("td span strong").size == 4
          prop[:away_team] = "#{p.css("td span strong")[0].text}" + "#{p.css("td span strong")[1].text}"
          prop[:home_team] = "@"+"#{p.css("td span strong")[2].text}" + "#{p.css("td span strong")[3].text}"
        elsif p.css("td span strong").size == 3 && prop[:away_team].include?("#")
          prop[:away_team] = "#{p.css("td span strong")[0].text}" + "#{p.css("td span strong")[1].text}"
          prop[:home_team] = "@"+"#{p.css("td span strong")[2].text}"
        elsif p.css("td span strong").size == 3 && prop[:home_team].include?("#")
          prop[:away_team] = "#{p.css("td span strong")[0].text}"
          prop[:home_team] = "@"+"#{p.css("td span strong")[1].text}" + "#{p.css("td span strong")[2].text}"
        else
        end
        Prop.new(prop)
    end
  end

#   def self.all_props
#     @@props
#   end
end
