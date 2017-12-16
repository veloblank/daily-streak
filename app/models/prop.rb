class Prop < ActiveRecord::Base

  @@props = []

  attr_accessor :event_title, :start_time, :sport, :away_team, :home_team, :away_team_url, :home_team_url, :matchup_status

  def initialize(hash)
    @event_title = hash[:event_title]
    @start_time = hash[:start_time]
    @sport = hash[:sport]
    @away_team = hash[:away_team]
    @home_team = hash[:home_team]
    @away_team_url = hash[:away_team_url]
    @home_team_url = hash[:home_team_url]
    @matchup_status = hash[:matchup_status]
    @@props << self
  end

  def self.props_by_sport(sport)
    @@props.select {|prop| prop.sport == sport}
  end

  def self.all_props
    @@props
  end

end
