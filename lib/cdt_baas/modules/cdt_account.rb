module CdtBaas

	class CdtAccount < CdtModule

		def initialize(token, env)
			startModule(token, env)
		end

		def getAccounts(id)
			response = @request.get(@url + ACCOUNT_PATH + '/' + id.to_s)
			person = CdtModel.new(response)
			person
		end

		def getUserAccounts(body)
			response = @request.get(@url + ACCOUNT_PATH + CdtHelper.conductorBodyToString(body))
			person = CdtModel.new(response)
			person
		end

		def getTimeline(body)
			response = @request.get(@url + ACCOUNT_PATH + '/' + body[:id].to_s + '/' + TIMELINE_PATH + CdtHelper.conductorBodyToString(body))
			person = CdtModel.new(response)
			person
		end

		def getTransactions(body)
			url = @url + ACCOUNT_PATH + '/' + body[:id].to_s + '/' + TRANSACTIONS_PATH
			body[:id] = nil
			response = @request.get(url + CdtHelper.conductorBodyToString(body))
			person = CdtModel.new(response)
			person
		end

		def getTransactionsNew(body)
			url = @url + NEW_ACCOUNT_PATH + '/' + body[:id].to_s + '/' + NEW_TRANSACTIONS_PATH
			body[:id] = nil
			response = @request.get(url + CdtHelper.conductorBodyToString(body))
			person = CdtModel.new(response)
			person
		end

		def activeAccount(body)
			response = @request.post(@url + ACCOUNT_PATH + '/' + body[:id].to_s + '/' + ACTIVE_PATH, {})
			person = CdtModel.new(response)
			person
		end

		def addNonameCard(body)
			response = @request.postWithHeader(@url + ACCOUNT_PATH + '/' + body[:id].to_s + '/' + ADD_NONAME_TO_ACCOUNT, body, [jsonHeader])
			person = CdtModel.new(response)
			person
		end

		def blockedAccount(id,body)
			response = @request.post(@url + ACCOUNT_PATH + '/' + id.to_s + '/' + BLOCKED_PATH + CdtHelper.conductorBodyToString(body), {})
			person = CdtModel.new(response)
			person
		end

		def cancelAccount(body)
			response = @request.post(@url + ACCOUNT_PATH + '/' + body[:id].to_s + '/' + CANCEL_PATH + CdtHelper.conductorBodyToString(body), {})
			person = CdtModel.new(response)
			person
		end

		def createBankSlip(body)
			response = @request.post(@url + ACCOUNT_PATH + '/' + body[:id].to_s + '/' + BANK_SLIP_PATH + CdtHelper.conductorBodyToString(body), {})
			person = CdtModel.new(response)
			person
		end

		def createCard(body)
			response = @request.post(@url + ACCOUNT_PATH + '/' + body[:id].to_s + '/' + CARD_PATH + CdtHelper.conductorBodyToString(body), body, true)
			person = CdtModel.new(response)
			person
		end

		def createVirtualCard(body)
			response = @request.post(@url + ACCOUNT_PATH + '/' + body[:id].to_s + '/' + VIRTUAL_CARD_PATH + CdtHelper.conductorBodyToString(body), {})
			person = CdtModel.new(response)
			person
		end	

    	def createAccount(body)
         	response = @request.post(@url + ACCOUNT_PATH + CdtHelper.conductorBodyToString(body), body, true)
         	person = CdtModel.new(response)
         	person
     	end

	     def updateDetails(id, body)
	         response = @request.put(@url + ACCOUNT_PATH + '/' + id.to_s + "/adicionais" + CdtHelper.conductorBodyToString(body))
	         # response = @request.put(@url + ACCOUNT_PATH + CdtHelper.conductorBodyToString(body))
	         person = CdtModel.new(response)
	         person
	     end

	     def createDetails(id, body)
	         response = @request.post(@url + ACCOUNT_PATH + '/' + id.to_s + "/adicionais", body, [jsonHeader])
	         # response = @request.put(@url + ACCOUNT_PATH + CdtHelper.conductorBodyToString(body))
	         person = CdtModel.new(response)
	         person
	     end

         def create_temp_card(id)
             response = @request.post(@url + ACCOUNT_PATH + '/' + id.to_s + CREATE_TEMPORARY_CARD, {}, [jsonHeader])
             card = CdtModel.new(response)
             card
         end

	end
end
