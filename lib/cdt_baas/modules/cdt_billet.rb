module CdtBaas

	class CdtBillet < CdtModule

		def initialize(token, env)
			startModule(token, env)
		end

		def generateTicket(body)
			response = @request.get(@url + BILLET + CdtHelper.conductorBodyToString(body))
			response
		end

	end
end
