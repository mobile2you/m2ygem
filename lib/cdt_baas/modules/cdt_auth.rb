module CdtBaas
  class CdtAuth
    def initialize(token, env)
      @request = CdtRequest.new("Basic #{token}", token)
      @basic = token
      @url = CdtHelper.homologation?(env) ? TOKEN_HML : TOKEN_PRD
      @url = CdtHelper.customAuth?(env) ? TOKEN_CUSTOM_AUTH : @url
    end

    def generateToken
      puts @url
      body = { grant_type: 'client_credentials' }
      # response = @request.post(@url + TOKEN_PATH, body, {})
      response = @request.postWithHeader(@url + TOKEN_PATH, body, [jsonHeader])
      token = CdtModel.new(response)
      CdtBaas::CdtRequest.setToken(token)
      CdtHelper.saveToken(@basic, token.access_token)
      CdtHelper.generate_general_response(token)
    end
    
    def jsonHeader
      {:key => 'Content-Type', :value => "application/json"}
    end
  end

end
