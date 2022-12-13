module CdtBaas

	class CdtAddress < CdtModule

	     def initialize(token, env, fixed_ip_url = nil)
	        startModule(token, env, fixed_ip_url)
	     end

	 	 def checkZip(body)
	         response = @request.get(@url + ZIP_PATH + CdtHelper.conductorBodyToString(body))
	         person = CdtModel.new(response)
	         person
	     end

	 	 def getAddresses(body)
	         response = @request.get(@url + ADDRESSES_PATH + CdtHelper.conductorBodyToString(body))
	         person = CdtModel.new(response)
	         person
	     end

	 	 def createAddress(body)
	         response = @request.post(@url + ADDRESSES_PATH + CdtHelper.conductorBodyToString(body), {})
	         person = CdtModel.new(response)
	         person
	     end

	     def findAddress(id)
	         response = @request.get(@url + ADDRESSES_PATH + '/' + id.to_s)
	         person = CdtModel.new(response)
	         person
	     end

	     def updateAddress(id, body)
	         # response = @request.put(@url + ADDRESSES_PATH + id.to_s + "/" + CdtHelper.conductorBodyToString(body))
	         response = @request.put(@url + ADDRESSES_PATH + CdtHelper.conductorBodyToString(body))
	         person = CdtModel.new(response)
	         person
       end

    def updateMailingAddress(id, body)
      response = @request.put(@url + ADDRESSES_PATH + '/' + id.to_s +
        UPDATE_MAILING_ADDRESS + CdtHelper.conductorBodyToString(body))
      person = CdtModel.new(response)
      person
    end
 	end

end