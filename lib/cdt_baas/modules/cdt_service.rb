module CdtBaas
  class CdtService < CdtModule
    def initialize(token, env)
      startModule(token, env)
    end

    def p2pTransfer(body)
      response = @request.post(@url + P2P_PATH, body, true)
      p2pResponse = CdtModel.new(response)
      generateResponse(p2pResponse)
    end

    def getp2pTransfer(body)
      response = @request.get(@url + P2P_PATH + '/' + DETAILS + CdtHelper.conductorBodyToString(body))
      p2pResponse = response
      generateResponse(p2pResponse)
    end

    def listp2pTransfer(account)
      response = @request.get(@url + P2P_PATH + "?originalAccount=#{account}")
      p2pResponse = response
      generateResponse(p2pResponse)
    end

    def findp2pTransfer(body)
      response = @request.get(@url + P2P_PATH + CdtHelper.conductorBodyToString(body))
      p2pResponse = response
      generateResponse(p2pResponse)
    end

    def findp2pAdjustment(id)
      response = @request.get(@url + P2P_ADJUSTMENT + id.to_s)
      p2pResponse = response
      generateResponse(p2pResponse)
    end

    def findtedAdjustment(id)
      response = @request.get(@url + TED_ADJUSTMENT + id.to_s)
      tedResponse = response
      generateResponse(tedResponse)
    end
  end
end
