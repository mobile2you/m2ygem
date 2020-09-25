module CdtBaas

  class CdtPixKeys < CdtModule

    def initialize(token, env)
      startModule(token, env)
    end

    def pix_url
      @url.gsub("api", "pix-baas")
    end

    def checkKey(body)
      url = pix_url
      response = @request.get(url + CHECK_KEYS + CdtHelper.conductorBodyToString(body), [jsonHeader])
      generateResponse(response)
    end

    def createKey(body)
      url = pix_url + CREATE_KEY
      response = @request.post(url, body, true)
      generateResponse(response)
    end

    def getKeys(account)
      url = pix_url
      response = @request.get(url + CREATE_KEY + "?idAccount=#{account}", [jsonHeader])
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
