module CdtBaas

	class CdtRegister < CdtModule

		def initialize(token, env)
			startModule(token, env)
		end

		def sendSelfie(id)
			response = @request.get(@url + RECHARGES + id.to_s)
			if !response.length > 0
				rechargeResponse = CdtModel.new(response)
			else
				rechargeResponse = response
			end
			generateResponse(rechargeResponse)
		end

		def sendDocument(id, body)
			response = @request.post(@url + RECHARGES + id.to_s, body, true)
			rechargeResponse = CdtModel.new(response)
			generateResponse(rechargeResponse)
		end

	end
end
