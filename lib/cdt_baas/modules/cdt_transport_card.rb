module CdtBaas

  class CdtTransportCard < CdtModule

    def initialize(token, env, fixed_ip_url = nil)
      startModule(token, env, fixed_ip_url)
    end

    def transportCards(number)
      response = @request.get(@url + TRANSPORT_CARDS + number.to_s)
      person = CdtModel.new(response)
      person
    end

    def getTransportCards(body)
      response = @request.get(@url + TRANSPORT_CARDS_RECHARGE + CdtHelper.conductorBodyToString(body), {}, false)
      person = CdtModel.new(response)
      person
    end

    def newRecharge(body)
      response = @request.post(@url + TRANSPORT_CARDS_RECHARGE, body, true)
      person = CdtModel.new(response)
      person
    end

    def getRecharges(number)
      response = @request.get(@url + TRANSPORT_CARDS_ACCOUNT + number.to_s, [jsonHeader], false)
      response
    end
  end
end
