class CreateVotings < ActiveRecord::Migration
  def change
    create_table :votings do |t|
      t.references :application
      t.references :user
      t.references :category
      t.float :score
      t.timestamps
    end
  end
end
