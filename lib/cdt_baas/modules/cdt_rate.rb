module CdtBaas

	class CdtRate < CdtModule

		def initialize(token, env, fixed_ip_url = nil)
			startModule(token, env, fixed_ip_url)
		end

		def getCarrierDetails(body)
			response = @request.get(@url + RATE + CARRIER_DETAILS + CdtHelper.conductorBodyToString(body), [{:key => 'Content-Type', :value => 'application/json'}])
			response
		end

		def getCarrierCalculate(body)
			response = @request.get(@url + RATE + CALCULATE + CdtHelper.conductorBodyToString(body), [{:key => 'Content-Type', :value => 'application/json'}])
			response
		end

		def waived(body)
			response = @request.post(@url + WAIVED, body, true)
			response
		end
		
	end
end
