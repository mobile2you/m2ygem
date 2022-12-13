module CdtBaas

	class CdtVoucher < CdtModule

		def initialize(token, env, fixed_ip_url = nil)
			startModule(token, env, fixed_ip_url)
		end

		def getMerchants(version = 1)
			url = @url.gsub("api", "voucher") + 'v' + version.to_s
			response = @request.get(url + MERCHANTS)
	        cdt_model = CdtModel.new(response)
	        cdt_model
		end

		def createOrder(merchantId, version = 1)
			url = @url.gsub("api", "voucher") + 'v' + version.to_s + '/'
			response = @request.post(@url + merchantId + CREATE_ORDER, {}, true)
	        cdt_model = CdtModel.new(response)
	        cdt_model
		end

		def confirmOrder(orderId, body, version = 1)
			url = @url.gsub("api", "voucher") + 'v' + version.to_s + '/'
			response = @request.post(@url + orderId  + CONFIRM_ORDER, body, true)
	        cdt_model = CdtModel.new(response)
	        cdt_model
		end

	 	def getReceipts(body, version = 1)
	        url = @url.gsub("api", "voucher") + 'v' + version.to_s + '/'
	        response = @request.get(url + RECEIPTS + CdtHelper.conductorBodyToString(body))
	        cdt_model = CdtModel.new(response)
	        cdt_model
	    end

	end
end