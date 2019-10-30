require 'json'

module CdtBaas
	class CdtHelper
		
		def self.homologation?(env)
			env == HOMOLOGATION
		end
		
		def self.productionBr?(env)
			env == ONLYPAY
		end

		def self.saveToken(basic,token)
			if !token.nil?
				ENV["CDT_TOKEN#{basic[0,6]}"] = token.to_s
				ENV["CDT_TOKEN_EXPIRY#{basic[0,6]}"] = (Time.now + 1500).to_s
			end
		end

		def self.shouldRefreshToken?(basic)
			finish_date = ENV["CDT_TOKEN_EXPIRY#{basic[0,6]}"]
			finish_date.nil? || (Time.parse(finish_date.to_s) - 500) < Time.now
		end


		def self.conductorBodyToString(json)
			string = "?"
			arr = []
			json.keys.each do |key|
				if !json[key].nil?
					arr << key.to_s + "=" + json[key].to_s
				end
			end
			string + arr.join("&")
		end

		def self.generate_general_response(input)
			cdtErrorHandler = CdtErrorHandler.new
			response = {}
			if cdtErrorHandler.mapErrorType(input)
				response = {
						success: false,
						error: cdtErrorHandler
				}
			else
				response = {
						success: true,
						content: input
				}
			end
			response
		end
	end
end


