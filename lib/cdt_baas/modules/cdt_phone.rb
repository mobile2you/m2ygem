module CdtBaas

	class CdtPhone < CdtModule
		def initialize(token, env, fixed_ip_url = nil)
			startModule(token, env, fixed_ip_url)
		end

		def getPhones(body)
			response = @request.get(@url + PHONES_PATH + CdtHelper.conductorBodyToString(body))
			phonesResponse = CdtModel.new(response)
			generateResponse(phonesResponse)
		end

		def createPhone(body)
			response = @request.post(@url + PHONES_PATH + CdtHelper.conductorBodyToString(body), {})
			phonesResponse = CdtModel.new(response)
			generateResponse(phonesResponse)
		end

		def findPhone(id)
			response = @request.get(@url + PHONES_PATH + '/' + id.to_s)
			phonesResponse = CdtModel.new(response)
			generateResponse(phonesResponse)
		end

		def updatePhone(body)
			response = @request.put(@url + PHONES_PATH + CdtHelper.conductorBodyToString(body), {})
			phonesResponse = CdtModel.new(response)
			generateResponse(phonesResponse)
		end

 	end

end
