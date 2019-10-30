module CdtBaas

	class CdtCep < CdtModule

		def initialize(token, env)
			startModule(token, env)
		end

		def ceps(body)
			response = @request.get(@url + CEPS + CdtHelper.conductorBodyToString(body))
			person = CdtModel.new(response)
			person
		end

	end
end