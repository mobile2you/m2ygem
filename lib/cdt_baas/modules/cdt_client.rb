module CdtBaas

	class CdtClient < CdtModule

		def initialize(token, env, fixed_ip_url = nil)
			startModule(token, env, fixed_ip_url)
		end

		def registerPFAccount(body)
			response = @request.post(@url + REGISTER_PF_ACCOUNT, body, true)
			person = CdtModel.new(response)
			person
		end

		def registerPJAccount(body)
			response = @request.post(@url + REGISTER_PJ_ACCOUNT, body, true)
			person = CdtModel.new(response)
			person
		end

	end
end
