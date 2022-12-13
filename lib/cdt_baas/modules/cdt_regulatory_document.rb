module CdtBaas

	class CdtRegulatoryDocument < CdtModule

		def initialize(token, env, fixed_ip_url = nil)
			startModule(token, env, fixed_ip_url)
		end

	 	 def getRegistrations(version = 1)
	 	 	 @url = @url.gsub("api", "regdocs") + 'v' + version.to_s + '/' 
	         response = @request.get(@url + REGISTRATION)
	         person = CdtModel.new(response)
	         person
	     end

	 	 def getRegistrationsWithCustomTypes(version = 1, types)
	 	 	 @url = @url.gsub("api", "regdocs") + 'v' + version.to_s + '/' 
	         response = @request.get(@url + REGISTRATION + types)
	         person = CdtModel.new(response)
	         person
	     end

	 	 def getRegistrationsWithTypes(version = 1)
	 	 	 @url = @url.gsub("api", "regdocs") + 'v' + version.to_s + '/' 
	         response = @request.get(@url + REGISTRATION + REGISTRATION_WITH_TYPES)
	         person = CdtModel.new(response)
	         person
	     end

	 	 def sendAgreement(body, version = 1)
	 	 	 @url = @url.gsub("api", "regdocs") + 'v' + version.to_s + '/' 
             response = @request.postWithHeader(@url + AGREEMENT, body, [jsonHeader])
	         person = CdtModel.new(response)
	         person
	     end


	end
end