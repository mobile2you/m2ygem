module CdtBaas

	class CdtSms < CdtModule
		def initialize(token, env, fixed_ip_url = nil)
			startModule(token, env, fixed_ip_url)
		end


		def sendSms(body)
			response = @request.postWithHeader(@url + SMS_PATH, body, [jsonHeader])
			phonesResponse = CdtModel.new(response)
			generateResponse(phonesResponse)
		end

 	end

end
