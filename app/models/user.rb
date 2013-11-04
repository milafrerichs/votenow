class User < ActiveRecord::Base
  has_many :votings
end
