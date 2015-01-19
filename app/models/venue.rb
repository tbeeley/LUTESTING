require 'active_record'

class Venue < ActiveRecord::Base

	def self.save_data_from(json)
		file = File.read(json)
    	venue_data = JSON.parse(file)
    	venue_data.each {|each_venue| Venue.new(each_venue).save}
   	end

end