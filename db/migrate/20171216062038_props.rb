class Props < ActiveRecord::Migration
  def change
    create_table :props do |t|
      t.datetime :date
      t.text :title
      t.datetime :time
      t.text :sport
      t.text :away_team
      t.text :home_team
      t.text :away_team_url
      t.text :home_team_url
      t.boolean :status_started?

    end

  end
end
