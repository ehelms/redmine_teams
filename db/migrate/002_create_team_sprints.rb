class CreateTeamSprints < ActiveRecord::Migration
  def change
    create_table :team_sprints do |t|
      t.string :name
      t.integer :team_id
      t.boolean :backlog, :default => :false
    end
  end
end
