class ReportEmailMailer < ApplicationMailer
	def send_report(business)
		@business = business
		puts("EMail is #{@business.email}")
		mail(to: @business.email,subject: "Review Analysis Report")
	end
end
