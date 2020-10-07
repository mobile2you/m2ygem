module CdtBaas

	class CdtDocspy < CdtModule

		def initialize(token, env)
			startModule(token, env)
		end

		def sendDocuments(params, options)
			options[:headers] = {}
			options[:headers] = {
          		'Content-Type' => 'image/jpeg',
          		'Accept' => '*/*'
      		}

			response = @request.postBinary(@url + DOCSPY_SELFIES + CdtHelper.conductorBodyToString(params), options)
			person = CdtModel.new(response)
			person
		end

		def documentsRules
			response = @request.get(@url + DOCSPY_DOCUMENTS_RULES)
			person = CdtModel.new(response)
			person
		end

		def sendSelfies(params, options)
			options[:headers] = {}
			options[:headers] = {
          		'Content-Type' => 'image/jpeg',
          		'Accept' => '*/*'
      		}

			response = @request.postBinary(@url + DOCSPY_SELFIES + CdtHelper.conductorBodyToString(params), options)
			person = CdtModel.new(response)
			person
		end

		def selfiesRules
			response = @request.get(@url + DOCSPY_SELFIES_RULES)
			person = CdtModel.new(response)
			person
		end

    def downloadDocument(id)
      url_request = @url + DOCSPY_DOCUMENTS_V1 + '/' + DOWNLOAD + '/' + id
      response = @request.get(url_request, [], false, false)
    end
	end
end
