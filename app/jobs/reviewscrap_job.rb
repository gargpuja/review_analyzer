class ReviewscrapJob < ApplicationJob
  queue_as :default

  def perform(*args)
  	puts "Location is #{args[0].inspect}"
  	
    # Do something later
  end
end
