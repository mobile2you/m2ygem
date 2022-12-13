module CdtBaas

  class CdtPixKeys < CdtModule

    def initialize(token, env, fixed_ip_url = nil)
      startModule(token, env, fixed_ip_url)
    end

    def pix_url
      @url.gsub("api", "pix-baas")
    end

    def checkKey(key, account)
      url = pix_url
      response = @request.get(url + CHECK_KEYS + "/#{key}/account/#{account}", [jsonHeader])
      generateResponse(response)
    end

    def createKey(body)
      url = pix_url + CREATE_KEY
      response = @request.post(url, body, true)
      generateResponse(response)
    end

    def getKeys(account)
      url = pix_url
      if account.nil?
        response = @request.get(url + CREATE_KEY , [jsonHeader])
      else
        response = @request.get(url + CREATE_KEY + "?idAccount=#{account}", [jsonHeader])
      end
      generateResponse(response)
    end


    def getKeysByType(key, keyType)
      url = pix_url
      response = @request.get(url + CREATE_KEY + "?key=#{key}&keyType=#{keyType}", [jsonHeader])
      generateResponse(response)
    end

    def updateKey(body)
      url = pix_url
      response = @request.put(url + CREATE_KEY, body, [jsonHeader])
      generateResponse(response)
    end

    def claimKey(body)
      url = pix_url + CLAIM_KEY
      response = @request.post(url, body, true)
      generateResponse(response)
    end

    def getKeyClaims(account)
      url = pix_url
      if account.nil?
        response = @request.get(url + CLAIM_KEY , [jsonHeader])
      else
        response = @request.get(url + CLAIM_KEY + "?idAccount=#{account}&limit=100", [jsonHeader])
      end
      generateResponse(response)
    end

    def claimKeyConfirmation(body)
      url = pix_url + CLAIM_KEY_CONFIRMATION
      response = @request.post(url, body, true)
      generateResponse(response)
    end

    def deleteKey(body)
      url = pix_url
      response = @request.delete(url + CREATE_KEY, body, [jsonHeader])
      generateResponse(response)
    end

  end
end
