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
	         response = @request.get(@url + CARD.gsub('/', '') + CdtHelper.conductorBodyToString(body))
	         person = CdtModel.new(response)
	         person
	     end

	 	 def getCards(body)
	         response = @request.get(@url + CARD_PLAIN + CdtHelper.conductorBodyToString(body))
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
	         response = @request.post(@url + CARD + id.to_s + '/' + CREATE_NEW_CARD, {}, true)
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

      def createControlLimit(id, body)
        response = @request.post(@url + CARD + id.to_s + CONTROLS_LIMITS, body, [jsonHeader])
        card = CdtModel.new(response)
        card
      end

      def updateControlLimit(id, control_limit_id, body)
        response = @request.patch(@url + CARD + id.to_s + CONTROLS_LIMITS + '/' + control_limit_id.to_s, body, [jsonHeader])
        card = CdtModel.new(response)
        card
      end

      def getControlLimit(id, control_limit_id)
        response = @request.get(@url + CARD + id.to_s + CONTROLS_LIMITS + '/' + control_limit_id.to_s, {}, [jsonHeader])
        card = CdtModel.new(response)
        card
      end

      def createControlSettings(id, body)
        response = @request.post(@url + CARD + id.to_s + '/' + CONTROLS_SETTINGS, body, [jsonHeader])
        card = CdtModel.new(response)
        card
      end

      def updateControlSettings(id, control_settings_id, body)
        response = @request.patch(@url + CARD + id.to_s + '/' + CONTROLS_SETTINGS + '/' + control_settings_id.to_s, body, [jsonHeader])
        card = CdtModel.new(response)
        card
      end

      def listControlSettings(body = nil)
        response = @request.get(@url + CARD + CONTROLS_SETTINGS + CdtHelper.conductorBodyToString(body))
        card = CdtModel.new(response)
        card
      end

      def getControlSettings(id, control_settings_id)
        response = @request.get(@url + CARD + id.to_s + '/' + CONTROLS_SETTINGS + '/' + control_settings_id.to_s)
        card = CdtModel.new(response)
        card
      end

      def deleteControlSettings(id, control_settings_id)
        response = @request.delete(@url + CARD + id.to_s + '/' + CONTROLS_SETTINGS + '/' + control_settings_id.to_s)
        card = CdtModel.new(response)
        card
      end

      def enableCardToBeUnlocked(id)
        body = {
          id: 4
        }
        response = @request.post(@url + CARD + id.to_s + CHANGE_CARD_PHASE, body, [jsonHeader])
        card = CdtModel.new(response)
        card
      end
  end
end
