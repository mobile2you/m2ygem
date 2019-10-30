module CdtBaas

	class CdtPayment < CdtModule

		def initialize(token, env)
			startModule(token, env)
		end

		def payment(body, version = 0)

			if version != 0
				url = @url.gsub("api", "payments") + 'v' + version.to_s + '/'
			else
				url = @url + PAYMENT
			end

			response = @request.post(url, body, true)
			payment = CdtModel.new(response)
			generateResponse(payment)
		end

		def paymentValidate(barCode, version = 0)

			if version != 0
				url = @url.gsub("api", "payments") + 'v' + version.to_s + '/' + VALIDATE + barCode
			else
				url = @url + PAYMENT_VALIDATE + barCode
			end

			response = @request.get(url)
			payment = CdtModel.new(response)
			generateResponse(payment)
		end

		def getPayment(id)

			response = @request.get(@url + PAYMENT + ACCOUNT + id.to_s)
			payment = response
			generateResponse(payment)
		end

		def paymentAdjustment(idAdjustment)

			response = @request.get(@url + PAYMENT_ADJUSTMENT + idAdjustment.to_s)
			payment = CdtModel.new(response)
			generateResponse(payment)
		end

		def getReceipts(body, version = 1)

			url = @url.gsub("api", "payments") + 'v' + version.to_s + '/'

			response = @request.get(url + RECEIPTS + CdtHelper.conductorBodyToString(body))
			payment = response
			generateResponse(payment)
		end

		def getScheduler(body, version = 0)

			if version != 0
				url = @url.gsub("api", "payments") + 'v' + version.to_s + '/'
			else
				url = @url + SCHEDULER
			end

			response = @request.get(url + SCHEDULER + CdtHelper.conductorBodyToString(body))
			payment = CdtModel.new(response)
			generateResponse(payment)
		end

		def scheduler(body, version = 0)

			if version != 0
				url = @url.gsub("api", "payments") + 'v' + version.to_s + '/'
			else
				url = @url + SCHEDULER
			end

			response = @request.post(url + SCHEDULER, body, true)
			payment = CdtModel.new(response)
			generateResponse(payment)
		end

		def deleteScheduler(id, version = 0)

			if version != 0
				url = @url.gsub("api", "payments") + 'v' + version.to_s + '/'
			else
				url = @url + SCHEDULER
			end

			response = @request.delete(url + SCHEDULER + id.to_s)
			payment = CdtModel.new(response)
			generateResponse(payment)
		end

	end
end