require 'date'

module CdtBaas
  class CdtTransactionsLimits < CdtModule
    def initialize(token, env)
      startModule(token, env)
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
      list_group_id = [1, 5]
      list_group_id.each do |group|
        url = "#{limits_url}#{LIMITS}/accounts/#{account}/trusted-destinations"
        url += CdtHelper.conductorBodyToString({ idServicesGroup: group })
        response = @request.get(url, [jsonHeader])
        list.push response unless response.blank?
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
      #TODO Ajustar isso
      url = "#{limits_url}#{LIMITS}/accounts/#{account}/trusted-destinations"
      body[:idServicesGroup] = 1
      body[:limits] = [
        {
          "limitType": '1',
          "limitValue": 15000.00
        },
        {
          "limitType": '2',
          "limitValue": 30000.00
        },
        {
          "limitType": '3',
          "limitValue": 900000.00
        },
        {
          "limitType": '4',
          "limitValue": 30000.00
        },
        {
          "limitType": '5',
          "limitValue": 15000.00
        }
      ]
      result = @request.post(url, body, true)
      result[:idServicesGroup] = body[:idServicesGroup]
      if result[:statusCode] > 201
        pending.push(result)
      else
        request.push(result)
      end
      
      body[:idServicesGroup] = 5
      body[:limits] = [
        {
          "limitType": '1',
          "limitValue": 45000.00
        },
          {
            "limitType": '2',
            "limitValue": 150000.00
          },
          {
            "limitType": '3',
            "limitValue": 900000.00
          },
          {
            "limitType": '4',
            "limitValue": 1000.00 
          },
          {
            "limitType": '5',
            "limitValue": 1000.00 
          }
        ]
        result = @request.post(url, body, true)
        result[:idServicesGroup] = body[:idServicesGroup]
        if result[:statusCode] > 201
          pending.push(result)
        else
          request.push(result)
        end
        
      request.present? ? request : pending
    end

  end
end
