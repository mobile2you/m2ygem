module CdtBaas

	class CdtAccount < CdtModule

		def initialize(token, env)
			startModule(token, env)
		end

		def getAccounts(id)
			response = @request.get(@url + ACCOUNT_PATH + id.to_s)
			person = CdtModel.new(response)
			person
		end

		def getUserAccounts(body)
			response = @request.get(@url + ACCOUNT_PATH + CdtHelper.conductorBodyToString(body))
			person = CdtModel.new(response)
			person
		end

		def getTimeline(body)
			response = @request.get(@url + ACCOUNT_PATH + body[:id].to_s + '/' + TIMELINE_PATH + CdtHelper.conductorBodyToString(body))
			person = CdtModel.new(response)
			person
		end

		def getTransactions(body)
			response = @request.get(@url + ACCOUNT_PATH + body[:id].to_s + '/' + TRANSACTIONS_PATH + CdtHelper.conductorBodyToString(body))
			person = CdtModel.new(response)
			person
		end

		def activeAccount(body)
			response = @request.post(@url + ACCOUNT_PATH + body[:id].to_s + '/' + ACTIVE_PATH, {})
			person = CdtModel.new(response)
			person
		end

		def blockedAccount(body)
			response = @request.post(@url + ACCOUNT_PATH + body[:id].to_s + '/' + BLOCKED_PATH + CdtHelper.conductorBodyToString(body), {})
			person = CdtModel.new(response)
			person
		end

		def cancelAccount(body)
			response = @request.post(@url + ACCOUNT_PATH + body[:id].to_s + '/' + CANCEL_PATH + CdtHelper.conductorBodyToString(body), {})
			person = CdtModel.new(response)
			person
		end

		def createBankSlip(body)
			response = @request.post(@url + ACCOUNT_PATH + body[:id].to_s + '/' + BANK_SLIP_PATH + CdtHelper.conductorBodyToString(body), {})
			person = CdtModel.new(response)
			person
		end

		def createCard(body)
			response = @request.post(@url + ACCOUNT_PATH + body[:id].to_s + '/' + CARD_PATH + CdtHelper.conductorBodyToString(body), body, true)
			person = CdtModel.new(response)
			person
		end

		def createVirtualCard(body)
			response = @request.post(@url + ACCOUNT_PATH + body[:id].to_s + '/' + VIRTUAL_CARD_PATH + CdtHelper.conductorBodyToString(body), {})
			person = CdtModel.new(response)
			person
		end	

    	def createAccount(body)
         	response = @request.post(@url + ACCOUNT_PATH + CdtHelper.conductorBodyToString(body), body, true)
         	person = CdtModel.new(response)
         	person
     	end

	     def updateDetails(id, body)
	         response = @request.put(@url + ACCOUNT_PATH + id.to_s + "/adicionais" + CdtHelper.conductorBodyToString(body))
	         # response = @request.put(@url + ACCOUNT_PATH + CdtHelper.conductorBodyToString(body))
	         person = CdtModel.new(response)
	         person
	     end

	     def createDetails(id, body)
	         response = @request.post(@url + ACCOUNT_PATH + id.to_s + "/adicionais", body, [{:key => 'Content-Type', :value => "application/json"}])
	         # response = @request.put(@url + ACCOUNT_PATH + CdtHelper.conductorBodyToString(body))
	         person = CdtModel.new(response)
	         person
	     end



	end
end
