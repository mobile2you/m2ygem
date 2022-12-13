require 'date'

module CdtBaas
  class CdtTransactionsLimits < CdtModule
    def initialize(token, env, fixed_ip_url = nil)
      startModule(token, env, fixed_ip_url)
    end

    def limits_url
      @url.gsub('api', 'limits')
    end

    def list_limits(account, group)
      url = "#{limits_url}#{LIMITS}/accounts/#{account}?idServicesGroup=#{group.to_i}"
      response = @request.get(url)
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

    def update_account_timetables(body, account)
      url = "#{limits_url}#{LIMITS}/accounts/#{account}/timetables"
      response = @request.put(url, body)
      generateResponse(response)
    end

    def list_limits_all_groups(body)
      url = limits_url + LIMITS
      response = @request.get(url + CdtHelper.conductorBodyToString(body), [jsonHeader])
      generateResponse(response)
    end

    def trusted_destinations(account)
      list = []
      g = 1
      5.times do
        url = "#{limits_url}#{LIMITS}/accounts/#{account}/trusted-destinations"
        url += CdtHelper.conductorBodyToString({ idServicesGroup: g })
        response = @request.get(url, [jsonHeader])
        list.push response unless response.blank?
        g += 1
      end
      generateResponse(list)
    end

    def remove_trusted_destinations(account, id)
      url = "#{limits_url}#{LIMITS}/accounts/#{account}/trusted-destinations/#{id}"
      response = @request.delete(url)
      generateResponse(response)
    end

    def create_batch_limit_for_trusted_destination(body, account)
      request = []
      pending = []
      g = 1
      5.times do
        url = "#{limits_url}#{LIMITS}/accounts/#{account}/trusted-destinations"
        body[:idServicesGroup] = g
        result = @request.post(url, body, true)
        if result[:statusCode] > 201
          pending.push(result)
        else
          request.push(result)
        end
        g += 1
      end
      request.present? ? request : pending
    end
  end
end
