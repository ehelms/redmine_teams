class CreateBacklogs < ActiveRecord::Migration
  def change
    create_table :backlogs do |t|
      t.string :name
      t.integer :team_id
    end
  end
end
