class PostmarkService

  def headers
    {
      content_type: :json,
      accept: :json,
      'X-Postmark-Server-Token'=> Rails.application.config.postmark_server_api_token
    }
  end

  def send_mail(from, to, subject, body, tag="Review")
    payload = {
      From: from,
      To: to,
      Subject: subject,
      HtmlBody: body,
      Tag: tag,
      ReplyTo: from,
      TrackOpens: true
    }
    
    response = RestClient.post("https://api.postmarkapp.com/email", payload.to_json, headers)

    result =JSON.parse(response)
    Rails.logger.warn "Email has been sent to #{to} with response #{result}"
  end

end
