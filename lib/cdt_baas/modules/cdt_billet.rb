module CdtBaas

	class CdtBillet < CdtModule

		def initialize(token, env, fixed_ip_url = nil)
			startModule(token, env, fixed_ip_url)
		end

		def generateTicket(body)
			response = @request.get(@url + BILLET + CdtHelper.conductorBodyToString(body))
			response
		end

	end
end
