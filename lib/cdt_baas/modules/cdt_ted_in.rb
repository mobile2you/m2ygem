module CdtBaas

  class CdtTedIn < CdtModule

    def initialize(token, env)
      startModule(token, env)
    end

    def getReceipts(body, version = 1)
      url = @url.gsub("api", "banktransfersin") + 'v' + version.to_s + '/'
      response = @request.get(url + RECEIPTS + CdtHelper.conductorBodyToString(body))
      payment = response
      generateResponse(payment)
    end

  end
end
