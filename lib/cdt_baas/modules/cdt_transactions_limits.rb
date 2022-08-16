require 'date'

module CdtBaas

  class CdtTransactionsLimits < CdtModule

    def initialize(token, env) 
      startModule(token, env)
    end

    def limits_url
      @url.gsub("api", "limits")
    end

    def list_limits(account, group)
      url = "#{limits_url}#{LIMITS}/accounts/#{account}"
      url += CdtHelper.conductorBodyToString({ idServicesGroup: group.to_i })
      response = @request.get(url, [jsonHeader])
      generateResponse(response)
    end

    def create_limit(body, account, group)
      url = "#{limits_url}#{LIMITS}/accounts/#{account}/services-groups/#{group.to_i}"
      response = @request.post(url, body, true)
      generateResponse(response)
    end

    def list_account_timetables(account)
      url = "#{limits_url}#{LIMITS}/accounts/#{account}/timetables"
      response = @request.get(url, [jsonHeader])
      generateResponse(response)
    end

    def list_limits_all_groups(body)
      url = limits_url + LIMITS
      response = @request.get(url + CdtHelper.conductorBodyToString(body), [jsonHeader])
      generateResponse(response)
    end
  end
end
