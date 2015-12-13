require_relative '../models/lonely_planet_tours'

module LP_APIHelpers
	VERSION = '1.0.1'
  CATEGORIES = ['Small Group Tours', 'Adventure', 'Sightseeing', 'Health & Wellness', 'History & Culture', 'Water Sports', 'Short Break', 'Cycling', 'Nature & Wildlife', 'Holidays, Festivals & Seasonal']  #can scrape from lonely planet in case this updates

	def get_tours(country)
      Tours.new(country)
    rescue StandardError => e
      logger.info e.message
      halt 404, "#{e.message}"
    end

    def check_db_tours(resultset, country, tourslist)
      #if country tour details has not changed then show existing DB results
      if resultset && resultset.country == country && resultset.tours == tourslist
        'Record exists'
      else
      #if tours has changed but record exists just update the tour details
      if resultset && resultset.tours != tourslist && resultset.country == country
      	'Record exists but tour details changed'
      	else 
      	# if country not yet exists in the DB
      	'Country does not exist'
      end
      end
    end

    def strip_price(value)
      value.gsub('$','').to_i
    end

    def price_in_range(price, min, max)
      price >= min && price <= max
    end
end
