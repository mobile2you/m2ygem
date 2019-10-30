
module CdtBaas

	class CdtIndividual < CdtModule

        def initialize(token, env)
            startModule(token, env)
        end

        def createAccount(body)
            response = @request.postWithHeader(@url + "v2/" + INDIVIDUALS_ACCOUNTS, body, [{:key => 'Content-Type', :value => "application/json"}])
            person = CdtModel.new(response)
            person
        end

        def createPerson(body)
            response = @request.postWithHeader(@url + "v2/" + INDIVIDUALS, body, [{:key => 'Content-Type', :value => "application/json"}])
            person = CdtModel.new(response)
            person
        end

        def findPerson(id)
            response = @request.get(@url + "v2/" + INDIVIDUALS + id.to_s)
            person = CdtModel.new(response)
            person
        end

        def getPersons(body)
            response = @request.get(@url + "v2/" + INDIVIDUALS + CdtHelper.conductorBodyToString(body))
            person = CdtModel.new(response)
            person
        end

        def updatePerson(id, body)
            response = @request.put(@url + "v2/" + INDIVIDUALS + id.to_s , body, [{:key => 'Content-Type', :value => "application/json"}])
            person = CdtModel.new(response)
            person
        end

	end

end
