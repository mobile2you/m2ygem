module CdtBaas

  class CdtTransfer < CdtModule

    def initialize(token, env)
      startModule(token, env)
    end

    def bankTransfers(original_body)
      body = {
        {
          "idOriginAccount": original_body[:idOriginAccount],
          "identificator": original_body[:identificator],
          "description": original_body[:description],
          "beneficiary": {
            "type": original_body[:beneficiary][:type],
            "docIdCpfCnpjEinSSN": original_body[:beneficiary][:docIdCpfCnpjEinSSN],
            "name": original_body[:beneficiary][:name],
            "bankId": original_body[:beneficiary][:bankId],
            "agency": original_body[:beneficiary][:agency],
            "agencyDigit": "",
            "account": original_body[:beneficiary][:account],
            "accountDigit": original_body[:beneficiary][:accountDigit],
            "accountType": original_body[:beneficiary][:accountType]
          },
          "value": original_body[:value]
        }
      }
      response = @request.post(@url + BANK_TRANSFER, body, true)
      transferResponse = CdtModel.new(response)
      generateResponse(transferResponse)
    end

    def getBankTransfers(id)
      response = @request.get(@url + BANK_TRANSFER + '/' + ACCOUNT + id.to_s)
      transferResponse = response
      generateResponse(transferResponse)
    end

    def bankTransfersAdjustment(id)
      response = @request.get(@url + BANK_TRANSFER_ADJUST + id.to_s)
      transferResponse = CdtModel.new(response)
      generateResponse(transferResponse)
    end

  end
end
