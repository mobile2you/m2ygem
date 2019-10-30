module CdtBaas

	class CdtCard < CdtModule

	     def initialize(token, env)
	        startModule(token, env)
	     end

	 	 def findCard(id)
	         response = @request.get(@url + CARD + id.to_s)
	         person = CdtModel.new(response)
	         person
	     end

	 	 def findAccountCards(body)
	         response = @request.get(@url + CARD + CdtHelper.conductorBodyToString(body))
	         person = CdtModel.new(response)
	         person
	     end

	 	 def getCards(body)
	         response = @request.get(@url + CARD + CdtHelper.conductorBodyToString(body))
	         person = CdtModel.new(response)
	         person
	     end

	 	 def findCardData(id)
	         response = @request.get(@url + CARD + id.to_s + '/' + CARD_CONSULT)
	         person = CdtModel.new(response)
	         person
	     end

	     def passwordValidation(id, body)
	         response = @request.get(@url + CARD + id.to_s + '/' + PASSWORD_VALIDATION, [{:key => 'senha', :value => body[:password]}, {:key => 'Senha', :value => body[:password]}])
	         person = CdtModel.new(response)
	         person
	     end

	     def getCardLimit(id)
	         response = @request.get(@url + CARD + id.to_s + "/" + LIMIT_CONSULT)
	         person = CdtModel.new(response)
	         person
	     end

	     def createPfCard(body)
	         response = @request.post(@url + CREATE_PF_CARD + CdtHelper.conductorBodyToString(body), {})
	         person = CdtModel.new(response)
	         person
	     end

	     def createPjCard(body)
	         response = @request.post(@url + CREATE_PJ_CARD + CdtHelper.conductorBodyToString(body), {})
	         person = CdtModel.new(response)
	         person
	     end

	     def blockCard(id, body)
	         response = @request.post(@url + CARD + id.to_s + '/' + BLOCKED_PATH + CdtHelper.conductorBodyToString(body), {})
	         person = CdtModel.new(response)
	         person
	     end

	     def createNewCard(id)
	         response = @request.post(@url + CARD + id.to_s + '/' + CREATE_NEW_CARD, {})
	         person = CdtModel.new(response)
	         person
	     end

	     def unlockedIncorrectPassword(id)
	         response = @request.post(@url + CARD + id.to_s + '/' + UNLOCKED_INCORRECT_PASSWORD, {})
	         person = CdtModel.new(response)
	         person
	     end

	     def unlocked(id)
	         response = @request.post(@url + CARD + id.to_s + '/' + UNLOCKED, {})
	         person = CdtModel.new(response)
	         person
	     end

	     def createDebitCard(id, body)
	         response = @request.post(@url + CARD + id.to_s + '/' + CREATE_DEBIT_CARD + CdtHelper.conductorBodyToString(body), {})
	         person = CdtModel.new(response)
	         person
	     end

	     def registerPassword(id, body)
	         response = @request.postWithHeader(@url + CARD + id.to_s + '/' + REGISTER_PASSWORD + CdtHelper.conductorBodyToString(body), {}, [{:key => 'senha', :value => body[:password]}, {:key => 'Senha', :value => body[:password]}])
	         person = CdtModel.new(response)
	         person
	     end

	   	 def cancelCard(id, body)
	         response = @request.post(@url + CARD + id.to_s + '/' + CANCEL_PATH + CdtHelper.conductorBodyToString(body), {})
	         person = CdtModel.new(response)
	         person
	     end

	   	 def addHolder(id, body)
	         response = @request.put(@url + CARD + id.to_s + '/' + ADD_HOLDER + CdtHelper.conductorBodyToString(body))
	         person = CdtModel.new(response)
	         person
	     end

	   	 def updatePassword(id, body)
	         response = @request.put(@url + CARD + id.to_s + '/' + UPDATE_PASSWORD, {}, [{:key => 'senha', :value => body[:password]}])
	         person = CdtModel.new(response)
	         person
	     end

	     def createPrepaidCard(body)
	         response = @request.post(@url + CARD + PRE_PAID + CdtHelper.conductorBodyToString(body), {})
	         person = CdtModel.new(response)
	         person
	     end

	     def getLotes(body)
	         response = @request.get(@url + CARD + PRE_PAID + CdtHelper.conductorBodyToString(body))
	         person = CdtModel.new(response)
	         person
	     end

 	end

end