# Here is an exemple of how to populate the database with the seeds inside the engine itself or directly in the main app

#require 'open-uri' #used to open the txt file with the country code
# general_categories = ['country_of_origin', 'everyday', 'education']

# general_categories.each do |cat|
#   Selectable.create(category: "general_category", value: cat) unless Selectable.find_by_value("#{cat}")
# end


#countries
# File.open(Selectables::Engine.root.join("db/seeds/country_code.txt")) do |countries|
#   countries.read.each_line do |country|
#     code, name = country.chomp.split("|")
#     Selectables::Selectable.create!(category: "country_of_origin", value: name) unless Selectables::Selectable.find_by_value("#{name}")
#   end
# end

#mother_tongue
# File.open(Selectables::Engine.root.join("db/seeds/dialectes_fr.txt")) do |languages|
#   languages.read.each_line do |language|
#     Selectables::Selectable.create!(category: "mother_tongue", value: language.chomp) unless Selectables::Selectable.find_by_value("#{language.chomp}")
#   end
# end