
module CdtBaas

	class CdtIndividual < CdtModule

        def initialize(token, env)
            startModule(token, env)
        end

        def createAccount(body, version = 2)
            response = @request.postWithHeader(@url + "v#{version}/" + INDIVIDUALS_ACCOUNTS, body, [jsonHeader])
            person = CdtModel.new(response)
            person
        end

        def createPerson(body, version = 2)
            response = @request.postWithHeader(@url + "v#{version}/" + INDIVIDUALS, body, [jsonHeader])
            person = CdtModel.new(response)
            person
        end

        def addAdditionalPerson(id, body, version = 2)
            response = @request.postWithHeader(@url + "v#{version}/" + INDIVIDUALS_ACCOUNTS + '/' + id.to_s + ADDITIONAL, body, [jsonHeader])
            person = CdtModel.new(response)
            person
        end

        def findPerson(id, version = 2, params = {})
            response = @request.get(@url + "v#{version}/" + INDIVIDUALS + '/' + id.to_s + CdtHelper.conductorBodyToString(params))
            person = CdtModel.new(response)
            person
        end

        def getPersons(body, version = 2)
            response = @request.get(@url + "v#{version}/" + INDIVIDUALS + CdtHelper.conductorBodyToString(body))
            person = CdtModel.new(response)
            person
        end

        def updatePerson(id, body, version = 2)
            response = @request.put(@url + "v#{version}/" + INDIVIDUALS + '/' + id.to_s , body, [jsonHeader])
            person = CdtModel.new(response)
            person
        end

        def getDocuments(registration_id, version = 2)
            response = @request.get(@url + "v#{version}/" + INDIVIDUALS + '/' + registration_id.to_s + "/" + DOCUMENTS)
            person = CdtModel.new(response)
            person
        end
        def getPendingDocuments(registration_id, version = 2)
            response = @request.get(@url + "v#{version}/" + INDIVIDUALS + '/' + registration_id.to_s + "/" + PENDING_DOCUMENTS)
            person = CdtModel.new(response)
            person
        end

        def sendDocument(registration_id, params, options, version = 2)
            options[:headers] = {'Content-Type' => 'image/jpeg'} if options[:headers].blank?

            response = @request.postBinary(@url + "v#{version}/" + INDIVIDUALS + '/' + registration_id.to_s + "/" + DOCUMENTS + CdtHelper.conductorBodyToString(params), options)
            person = CdtModel.new(response)
            person
        end

	end

end
