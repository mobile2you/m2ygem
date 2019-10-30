module CdtBaas

	class CdtDocument < CdtModule

		def initialize(token, env)
			startModule(token, env)
		end

		def registerDocument(body)
			response = @request.post(@url + GENERATE_DOCUMENT + CdtHelper.conductorBodyToString(body), {}, true)
			person = CdtModel.new(response)
			person
		end

	end
end
