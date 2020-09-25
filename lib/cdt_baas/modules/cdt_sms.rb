module CdtBaas

	class CdtSms < CdtModule
		def initialize(token, env)
			startModule(token, env)
		end


		def sendSms(body)
			response = @request.postWithHeader(@url + SMS_PATH, body, [jsonHeader])
			phonesResponse = CdtModel.new(response)
			generateResponse(phonesResponse)
		end

 	end

end
