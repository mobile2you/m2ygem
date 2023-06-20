module CdtBaas

  class CdtVoucher < CdtModule

    def initialize(token, env)
      startModule(token, env)
    end

    def getMerchants(version = 1)
      url = @url.gsub("api", "voucher") + 'v' + version.to_s
      response = @request.get(url + MERCHANTS)
      response
    end

    def createOrder(merchantId, version = 1)
      url = @url.gsub("api", "voucher") + 'v' + version.to_s + '/'
      response = @request.post(url + merchantId + CREATE_ORDER, {}, true)
      response
    end

    def confirmOrder(orderId, body, version = 1)
      url = @url.gsub("api", "voucher") + 'v' + version.to_s + '/'
      response = @request.post(url + orderId  + CONFIRM_ORDER, body, true)
      response
    end

    def getReceipts(body, version = 1)
      url = @url.gsub("api", "voucher") + 'v' + version.to_s + '/'
      response = @request.get(url + RECEIPTS + CdtHelper.conductorBodyToString(body))
      response
    end

  end
end
