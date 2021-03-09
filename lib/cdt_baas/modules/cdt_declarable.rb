module CdtBaas
  class CdtDeclarable < CdtModule
    def initialize(token, env)
      startModule(token, env)
    end

    def declarables_url
      @url.gsub('api', 'declarables')
    end

    def listIncomeReports(account_id, version = 1)
      url = "#{declarables_url}v#{version}/#{REPORTS}/#{account_id}"
      response = @request.get(url)
      generateResponse(CdtModel.new(response))
    end

    def requestIncomeReport(body, version = 1)
      url = "#{declarables_url}v#{version}/#{REQUESTS}"
      response = @request.post(url, body, [jsonHeader])
      generateResponse(CdtModel.new(response))
    end

    def getIncomeReportTicket(ticket, version = 1)
      url = "#{declarables_url}v#{version}/#{REQUESTS}/#{ticket}"
      response = @request.get(url)
      generateResponse(CdtModel.new(response))
    end
  end
end
