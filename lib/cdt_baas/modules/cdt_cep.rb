module CdtBaas

	class CdtCep < CdtModule

		def initialize(token, env, fixed_ip_url = nil)
			startModule(token, env, fixed_ip_url)
		end

		def ceps(body)
			response = @request.get(@url + CEPS + CdtHelper.conductorBodyToString(body))
			person = CdtModel.new(response)
			person
		end

	end
end