require "docusign_rest"
module DocusignRestapi
	class Client < DocusignRest::Client

		def create_composite_template(options={})
			ios = create_file_ios(options[:files])
			file_params = create_file_params(ios)

			content_type = {'Content-Type' => 'application/json'}
			content_type.merge(options[:headers]) if options[:headers]

			post_body = "{
				\"emailBlurb\": \"Signature Notification\",
				\"emailSubject\": \"Signature Notification\",
				\"status\": \"sent\",
				\"compositeTemplates\": [{
					\"inlineTemplates\": [{
						\"sequence\": \"1\",
						\"recipients\": {
							\"signers\": [{
								\"recipientId\": \"1\",
								\"name\": \"#{options[:name]}\",
								\"clientUserId\":\"#{options[:email]}\",
								\"email\": \"#{options[:email]}\",
								\"defaultRecipient\": \"true\",
							}]
						}
					}],
					\"document\": {
						\"documentId\": \"1\",
						\"name\": \"#{options[:filename]}\",
						\"transformPdfFields\": \"true\"
					}
				}]
			}"
			uri = build_uri("/accounts/#{@acct_id}/envelopes")
			http = initialize_net_http_ssl(uri)
			request = Net::HTTP::Post::Multipart.new(uri.request_uri, {post_body: post_body}.merge(file_params),headers(options[:header]))

		  # DocuSign requires that we embed the document data in the body of the
		  # JSON request directly so we need to call ".read" on the multipart-post
		  # provided body_stream in order to serialize all the files into a
		  # compatible JSON string.
			request.body    = request.body_stream.read
			response        = http.request(request)
			parsed_response = JSON.parse(response.body)
		end
	end  
end
