require "httparty"

module CdtBaas

  class CdtRequest

    def initialize(token = nil, basic)
      if !token.nil?
        auth = token
      else
        auth = ENV["CDT_TOKEN#{basic[0,6]}"]
      end
      @headers = {
        "Content-Type" => 'application/x-www-form-urlencoded',
        "Authorization" => auth
      }
    end

    def self.setToken(token)
      if @headers.nil?
        @headers = {}
      end
      @headers["Authorization"] = token
    end

    def post(url, body, use_json = false)
      puts url.to_s
      if use_json
        @headers["Content-Type"] = 'application/json'
      end
      req = HTTParty.post(url,
                          body: body.to_json,
                          headers: @headers
                          )
      validResponse(req)
    end


    def postWithHeader(url, body, headers = [])
      # if use_json
      #   @headers["Content-Type"] = 'application/json'
      # end
      if headers.length > 0
        headers.each do |header|
          if !header[:key].nil? && !header[:value].nil?
            @headers[header[:key]] = header[:value]
          end
        end
      end

      puts url.to_s
      req = HTTParty.post(url,
                          body: body.to_json,
                          headers: @headers
                          )
      validResponse(req)
    end

    def postBinary(url, options = {})

      body = options[:body].nil? ? {} : options[:body]
      headers = options[:headers].nil? ? {} : options[:headers]
      use_logs = options[:use_logs].nil? ? true : options[:use_logs]

      headers['Authorization'] = @headers['Authorization']

      puts url.to_s if use_logs

      req = HTTParty.post(url,
                          body: body,
                          headers: headers
                          )

      validResponse(req)
    end

    def postNew(url, body)
      options = {
        headers: {
          'Authorization': @headers['Authorization'],
          'Content-Type': 'application/json'
        },
        body: {
          jwt: body[:jwt],
          imageBase64: body[:imageBase64]
        }
      }
      response = HTTParty.send(:post, url, options.to_json)
      byebug
      response
    end

    def get(url, headers = [], skipValidation = false, follow_redirects = true)
      if headers.length > 0
        headers.each do |header|
          if !header[:key].nil? && !header[:value].nil?
            @headers[header[:key]] = header[:value]
          end
        end
      end
      puts url.to_s
      req = HTTParty.get( url,
                          headers: @headers,
                          follow_redirects: follow_redirects
                         )
      return req unless follow_redirects

      if skipValidation
        req.parsed_response
      else
        validResponse(req)
      end
    end

    def put(url, body = {}, headers = [])
      if headers.length > 0
        headers.each do |header|
          @headers[header[:key]] = header[:value]
        end
      end

      req = HTTParty.put(url,
                         headers: @headers,
                         body: body.to_json
                         )
      validResponse(req)
    end

    def patch(url, body = {}, headers = [])
      if headers.length > 0
        headers.each do |header|
          @headers[header[:key]] = header[:value]
        end
      end
      req = HTTParty.patch(url,
                           headers: @headers,
                           body: body.to_json
                           )
      validResponse(req)
    end


    def delete(url, body = {}, headers = [])
      if headers.length > 0
        headers.each do |header|
          @headers[header[:key]] = header[:value]
        end
      end
      if body.nil?
        req = HTTParty.delete(url,
                              headers: @headers)
      else
        req = HTTParty.delete(url,
                           headers: @headers,
                           body: body.to_json)
      end
      validResponse(req)
    end


    def validJson?(json)
      JSON.parse(json)
      return true
    rescue JSON::ParserError => e
      return false
    end

    def validResponse(req)
      begin
        puts req.to_s
        ApiController.saveCdtErroLog('Conductor', req.parsed_response, req.code, req.request.last_uri.to_s)
      rescue
      end

      begin
        respose = req.parsed_response
        if respose.kind_of?(Hash)
          respose[:statusCode] = req.code
        end
        if respose.kind_of?(String)
          resposeJson = {}
          resposeJson[:message] = respose
          resposeJson[:statusCode] = req.code
          respose = resposeJson
        end
        respose
      rescue
        {:message => "Erro interno Baas", :statusCode => 500}
      end
    end

  end

end
