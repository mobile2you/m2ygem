module CdtBaas

	class CdtAlias < CdtModule

	     def initialize(token, env)
	        startModule(token, env)
	     end

	 	 def createAlias(body)
	 	 	 @url = @url.gsub("api.", "aliasbank.")
             response = @request.postWithHeader(@url + ALIAS_BANK, body, [{:key => 'Content-Type', :value => "application/json"}])
	         person = CdtModel.new(response)
	         person
	     end

	 	 def getAliases(body)
	 	 	 @url = @url.gsub("api.", "aliasbank.")
	         response = @request.get(@url + ALIAS_BANK + CdtHelper.conductorBodyToString(body))
	         person = CdtModel.new(response)
	         person
	     end

	end

end