
module CdtBaas

	class CdtRegistration < CdtModule

        def initialize(token, env)
            startModule(token, env)
        end

        def createRegistration(body, version = 1)
            response = @request.postWithHeader(@url + "v#{version}/" + REGISTRATIONS, body, [{:key => 'Content-Type', :value => "application/json"}])
            person = CdtModel.new(response)
            person
        end

        def findRegistration(id, version = 2)
            response = @request.get(@url + "v#{version}/" + REGISTRATIONS + id.to_s)
            person = CdtModel.new(response)
            person
        end

        def sendDocument(registration_id, params, options, version = 2)
            options[:headers] = {
                'Content-Type' => 'image/jpeg',
            }

            response = @request.postBinary(@url + "v#{version}/" + REGISTRATIONS + registration_id.to_s + "/" + DOCUMENTS + CdtHelper.conductorBodyToString(params), options)
            person = CdtModel.new(response)
            person
        end

	end

end
