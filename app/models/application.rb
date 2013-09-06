class Application < ActiveRecord::Base
  def name
    github_link.split('/').last.capitalize
  end

  def to_s
    name
  end
end
