module CdtBaas

	class CdtKyc < CdtModule

	     def initialize(token, env)
	        startModule(token, env)
	     end

	 	 def getPeople(body)
	         response = @request.post(@url + KYC, body, true)
	         person = CdtModel.new(response)
	         person
	     end

	end

end