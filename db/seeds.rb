# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Application.create(github_link: 'http://github.com/tho85/lunchpad')
Application.create(github_link: 'http://github.com/tilt/socially_awkward')
Application.create(github_link: 'http://github.com/NiDi/suckerfish')
Application.create(github_link: 'http://github.com/milafrerichs/votenow')

Category.create(name: 'Funktionalität')
Category.create(name: 'Design')
Category.create(name: 'Nützlichkeit')
Category.create(name: 'Completeness')
Category.create(name: 'Humor')
Category.create(name: 'Sympathie/Präsentation')

