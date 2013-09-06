class Application < ActiveRecord::Base
  has_many :votings

  def name
    github_link.split('/').last.capitalize
  end

  def to_s
    name
  end

  def score_for(category)
    relevant_votings = votings.where(category: category)
    score = 0
    relevant_votings.each do |v|
      score = score + v.score
    end

    if score > 0
      score / relevant_votings.count
    else
      0
    end
  end
  def overall_score
    votings.sum(&:score)/Category.count
  end
end
