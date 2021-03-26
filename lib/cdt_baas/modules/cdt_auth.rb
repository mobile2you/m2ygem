require 'chilkat'

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
      	response = @request.post(@url + TOKEN_PATH, {})
        token = CdtModel.new(response)
        CdtBaas::CdtRequest.setToken(token)
        CdtHelper.saveToken(@basic, token.access_token)
        CdtHelper.generate_general_response(token)
	   end
     
     def generateSignature
        pkey = Chilkat::CkPrivateKey.new()
        STR_PEM = ENV['STR_PRIVATE_KEY_RSA']

        success = pkey.LoadPem(STR_PEM)
        pkeyXml = pkey.getXml()
        rsa = Chilkat::CkRsa.new()
        success = rsa.ImportPrivateKey(pkeyXml)
       
        if (success != true)
            print rsa.lastErrorText() + "\n";
        end

        rsa.put_EncodingMode("utf-8")
        rsa.put_LittleEndian(false)
        time = Time.now.to_i / 60
        strSignature = "#{ENV['CDT_DOCKNITO_TOKEN']}:#{time}"

        cypherSignature = rsa.signStringENC(strSignature,"sha256")
        cypherSignature
     end
	end
end


