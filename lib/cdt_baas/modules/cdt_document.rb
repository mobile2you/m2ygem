module CdtBaas

	class CdtDocument < CdtModule

		def initialize(token, env, fixed_ip_url = nil)
			startModule(token, env, fixed_ip_url)
		end

		def registerDocument(body)
			response = @request.post(@url + GENERATE_DOCUMENT + CdtHelper.conductorBodyToString(body), {}, true)
			person = CdtModel.new(response)
			person
		end

	end
end
