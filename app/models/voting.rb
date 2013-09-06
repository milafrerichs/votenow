class Voting < ActiveRecord::Base
  belongs_to :application
  belongs_to :user
  belongs_to :category
end
