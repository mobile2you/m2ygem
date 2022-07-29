module CdtBaas
  class CdtRegistration < CdtModule
    def initialize(token, env)
      startModule(token, env)
    end

    def createRegistration(body, version = 1)
      @url = @url.gsub('api', 'companies') + 'v' + version.to_s + '/'
      byebug
      body[:company].delete(:tradeName) if body[:company][:tradename].blank?
      response = @request.postWithHeader(@url + REGISTRATIONS, body, [jsonHeader])
      CdtModel.new(response)
    end

    def findRegistration(id, version = 1)
      @url = @url.gsub('api', 'companies') + 'v' + version.to_s + '/'
      response = @request.get(@url + REGISTRATIONS + '/' + id.to_s)
      CdtModel.new(response)
    end

    def findCompany(id, version = 1)
      @url = @url.gsub('api', 'companies') + 'v' + version.to_s + '/'
      response = @request.get(@url + COMPANY_REGISTRATIONS + '/' + id.to_s)
      CdtModel.new(response)
    end

    def recoverCompanyRegistration(cnpj, version = 1)
      @url = @url.gsub('api', 'companies') + 'v' + version.to_s + '/'
      response = @request.get(@url + COMPANY_NATIONAL_REGISTRATIONS + '/' + cnpj)
      CdtModel.new(response)
    end

    def updateRegistration(id, body, version = 1)
      @url = @url.gsub('api', 'companies') + 'v' + version.to_s + '/'
      response = @request.put(@url + COMPANY_REGISTRATIONS + '/' + id.to_s, body, [jsonHeader])
      CdtModel.new(response)
    end

    def updateRegistrationByIdRegistration(id, body, version = 1)
      @url = @url.gsub('api', 'companies') + 'v' + version.to_s + '/'
      response = @request.put(@url + REGISTRATIONS + '/' + id.to_s, body, [jsonHeader])
      CdtModel.new(response)
    end

    def sendDocument(registration_id, params, options, version = 1)
      @url = @url.gsub('api', 'companies') + 'v' + version.to_s + '/'
      options[:headers] = {
        'Content-Type' => 'image/jpeg'
      }

      response = @request.postBinary(
        @url + REGISTRATIONS + '/' + registration_id.to_s + '/' + DOCUMENTS + CdtHelper.conductorBodyToString(params), options
      )
      CdtModel.new(response)
    end

    def sendDocumentPdf(registration_id, params, options, version = 1)
      @url = @url.gsub('api', 'companies') + 'v' + version.to_s + '/'
      options[:headers] = {
        'Content-Type' => 'application/pdf'
      }

      response = @request.postBinary(
        @url + REGISTRATIONS + '/' + registration_id.to_s + '/' + DOCUMENTS + CdtHelper.conductorBodyToString(params), options
      )
      CdtModel.new(response)
    end

    def getDocuments(registration_id, version = 1)
      @url = @url.gsub('api', 'companies') + 'v' + version.to_s + '/'
      response = @request.get(@url + REGISTRATIONS + '/' + registration_id.to_s + '/' + DOCUMENTS)
      CdtModel.new(response)
    end
  end
end
