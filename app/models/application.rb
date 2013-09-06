class Application < ActiveRecord::Base
  def name
    github_link.split('/').last.capitalize
  end
end
