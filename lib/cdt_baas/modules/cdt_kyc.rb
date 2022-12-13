module CdtBaas

	class CdtKyc < CdtModule

	     def initialize(token, env, fixed_ip_url = nil)
	        startModule(token, env, fixed_ip_url)
	     end

	 	 def getPeople(body)
	         response = @request.post(@url + KYC, body, true)
	         person = CdtModel.new(response)
	         person
	     end

	end

end