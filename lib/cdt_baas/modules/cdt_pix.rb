module CdtBaas

  class CdtPix < CdtModule

    def initialize(token, env)
      startModule(token, env)
    end

    def pix_url
      @url.gsub("api", "pix-baas")
    end

    def createStaticCode(body)
      url = pix_url + STATIC_CODE
      response = @request.post(url, body, true)
      generateResponse(response)
    end

    def createDynamicCode(body)
      url = pix_url + DYNAMIC_CODE
      response = @request.post(url, body, true)
      generateResponse(response)
    end

    def decodeCode(body)
      url = pix_url + DECODE_CODE
      response = @request.post(url, body, true)
      generateResponse(response)
    end

    def payPix(body)
      url = pix_url + PAY_PIX
      response = @request.post(url, body, true)
      generateResponse(response)
    end

    def cancelPix(body)
      url = pix_url + CANCEL_PIX
      response = @request.post(url, body, true)
      generateResponse(response)
    end

    def getReceipts(account, page, from = nil, to = nil)
      url = pix_url
      response = @request.get(url + LIST_PIX + "?idAccount=#{account}&currentPage=#{page}&from=#{from}&to=#{to}", [jsonHeader])
      generateResponse(response)
    end

  end
end
