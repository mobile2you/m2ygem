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
      response = @request.get(url + LIST_PIX + "?idAccount=#{account}&page=#{page}&from=#{from}&to=#{to}", [jsonHeader])
      generateResponse(response)
    end
    
    def getReversalReceipts(account, page, from = nil, to = nil)
      url = pix_url
      response = @request.get(url + LIST_PIX_REVERSAL + "?idAccount=#{account}&page=#{page}&from=#{from}&to=#{to}", [jsonHeader])
      generateResponse(response)
    end

    def getReceipt(transactionCode)
      url = pix_url
      response = @request.get(url + PAY_PIX + '/' + transactionCode + '/' + PIX_RECEIPT, [jsonHeader])
      generateResponse(response)
    end
    
    def getReversalReceipt(transactionCode)
      url = pix_url
      response = @request.get(url + PAY_PIX + '/' + transactionCode + '/' + PIX_RECEIPT_REVERSAL, [jsonHeader])
      generateResponse(response)
    end

    def getQRCodes(account, page)
      url = pix_url
      response = @request.get(url + LIST_CODES + "?idAccount=#{account}&page=#{page}&sort=asc", [jsonHeader])
      generateResponse(response)
    end
  end
end
