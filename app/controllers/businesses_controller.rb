class BusinessesController < ApplicationController
	def new
		@business = Business.new
	end

	def create
		@business = Business.new(business_params)
		if @business.save
			GenerateJob.perform_later(@business)
			flash[:success] = "Report Will be send to you shortly"
			redirect_to root_path
		else
			@errors = []
			@business.errors.messages.each do |k,v|
			@errors << k.to_s + " " + v[0]
		end
			#raise @business.errors.messages.inspect
			flash.now[:error] = @errors
    	render :new
		end

	end

	def business_params
    params.require(:business).permit(:name,:email)
  end
end
