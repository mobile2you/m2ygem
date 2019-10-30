module CdtBaas

  class CdtModule

      def startModule(token, env)
        @auth = CdtAuth.new(token, env)
        @basic = token
        refreshToken
        @request = CdtRequest.new(nil, @basic)
        @url = CdtHelper.homologation?(env) ? URL_HML : URL_PRD
        @url = CdtHelper.productionBr?(env) ? URL_ONLYPAY : @url
      end

      def refreshToken
        if CdtHelper.shouldRefreshToken?(@basic)
      		@auth.generateToken
          @request = CdtRequest.new(nil, @basic)
      	end
      end

      def generateResponse(input)
        CdtHelper.generate_general_response(input)
      end
  end

end
