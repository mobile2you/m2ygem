module CdtBaas

	class CdtService < CdtModule

		def initialize(token, env)
			startModule(token, env)
		end

		def p2pTransfer(body)
			response = @request.post(@url + P2P_PATH, body, true)
			p2pResponse = CdtModel.new(response)
			generateResponse(p2pResponse)
		end

		def getp2pTransfer(body)
			response = @request.get(@url + P2P_PATH + DETAILS + CdtHelper.conductorBodyToString(body))
			p2pResponse = response
			generateResponse(p2pResponse)
		end

		def findp2pTransfer(body)
			response = @request.get(@url + P2P_PATH + CdtHelper.conductorBodyToString(body))
			p2pResponse = response
			generateResponse(p2pResponse)
		end
	end
end
