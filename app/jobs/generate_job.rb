class GenerateJob < ApplicationJob
	queue_as :default

	def perform(*args)
		business = args[0]
		puts 'Hello World'  
		puts("Arguments are #{args[0].name}")
		page_token = nil
		begin
			url = if page_token.present?
			"https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{business.name}&sensor=false&key=#{GOOGLE_API_KEY}&pagetoken=#{page_token}"
		else
			"https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{business.name}&sensor=false&key=#{GOOGLE_API_KEY}"
		end
		puts "#{url}"
		sleep 15
		request = RestClient::Request.execute(method: :get,url: url)
		if request.code == 200
			response = JSON.parse(request.body)
			results = response['results']
			#results.each {|loc| place_ids  << loc['place_id']
			results.each do |loc|
				location = business.locations.create(address: loc['formatted_address'],location_name: loc['name'],place_id: loc['place_id'],rating: loc['rating'],business_id: business.id,review_count: loc['user_ratings_total'])
				ReviewscrapJob.perform_later(location)
			end
			page_token = response['next_page_token'].present? ? response['next_page_token'] : nil
			puts "page token is - #{page_token}"
		end
		end while page_token != nil		
		# postmark = PostmarkService.new
		#   	postmark.send_mail("notifications@synup.com",args[0].email, "Your Voice Readiness Report from Synup", email_content(args[0]))
	end

	def email_content(report)
		"<p>Hi there,</p>
		<p>As promised, here is a link to download your Voice Readiness Report for #{report.name}</p>
		<p>Your friends from Synup</p>"
	end

end
