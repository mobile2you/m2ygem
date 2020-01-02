module CdtBaas

	class CdtProduct < CdtModule
		def initialize(token, env)
			startModule(token, env)
		end

		def getProducts(body)
			response = @request.get(@url + PRODUCTS_PATH + CdtHelper.conductorBodyToString(body))
			phonesResponse = CdtModel.new(response)
			generateResponse(phonesResponse)
		end

 	end

end
