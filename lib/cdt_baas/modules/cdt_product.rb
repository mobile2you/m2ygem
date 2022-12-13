module CdtBaas

	class CdtProduct < CdtModule
		def initialize(token, env, fixed_ip_url = nil)
			startModule(token, env, fixed_ip_url)
		end

		def getProducts(body)
			response = @request.get(@url + PRODUCTS_PATH + CdtHelper.conductorBodyToString(body))
			phonesResponse = CdtModel.new(response)
			generateResponse(phonesResponse)
		end

 	end

end
