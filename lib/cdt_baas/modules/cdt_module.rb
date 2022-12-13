module CdtBaas

  class CdtModule

    def startModule(token, env, fixed_ip_url)
      @fixed_ip_url = fixed_ip_url
      @auth = CdtAuth.new(token, env, @fixed_ip_url)
      @basic = token
      refreshToken
      @request = CdtRequest.new(nil, @basic, @fixed_ip_url)
      @url = CdtHelper.homologation?(env) ? URL_HML : URL_PRD
      @url = CdtHelper.customAuth?(env) ? URL_CUSTOM_AUTH : @url
    end

    def refreshToken
      if CdtHelper.shouldRefreshToken?(@basic)
        @auth.generateToken
        @request = CdtRequest.new(nil, @basic, @fixed_ip_url)
      end
    end

    def generateResponse(input)
      CdtHelper.generate_general_response(input)
    end

    def jsonHeader
      {:key => 'Content-Type', :value => "application/json"}
    end
  end

end
