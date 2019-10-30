
module CdtBaas

	class CdtPerson < CdtModule


     def initialize(token, env)
        startModule(token, env)
     end

     def getPeople(body)
         response = @request.get(@url + PEOPLE_PATH + CdtHelper.conductorBodyToString(body))
         person = CdtModel.new(response)
         person
     end


     def findPerson(id)
         response = @request.get(@url + PEOPLE_PATH + id.to_s)
         person = CdtModel.new(response)
         person
     end

     def createPerson(body)
         response = @request.post(@url + PEOPLE_PATH + CdtHelper.conductorBodyToString(body), {})
         person = CdtModel.new(response)
         person
     end

     def updatePerson(id, body)
         response = @request.put(@url + PEOPLE_PATH + id.to_s + "/" + CdtHelper.conductorBodyToString(body))
         person = CdtModel.new(response)
         person
     end


     def createPersonDetails(body)
         response = @request.post(@url + PEOPLE_DETAILS_PATH + CdtHelper.conductorBodyToString(body), {})
         person = CdtModel.new(response)
         person
     end

     def findPersonDetails(id)
         response = @request.get(@url + PEOPLE_DETAILS_PATH + id.to_s)
         person = CdtModel.new(response)
         person
     end

     def updatePersonDetails(id, body)
         response = @request.get(@url + PEOPLE_DETAILS_PATH + id.to_s + "/" + CdtHelper.conductorBodyToString(body))
         person = CdtModel.new(response)
         person
     end

	end

end
