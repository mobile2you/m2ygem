module CdtBaas
  class CdtTransfer < CdtModule
    def initialize(token, env)
      startModule(token, env)
    end

    def bankTransfers(original_body)
      body =
        {
          "idOriginAccount": original_body[:idOriginAccount],
          "identificator": Time.now.to_i.to_s,
          "description": original_body[:description],
          "beneficiary": {
            "type": original_body[:beneficiary][:type],
            "docIdCpfCnpjEinSSN": original_body[:beneficiary][:docIdCpfCnpjEinSSN],
            "name": original_body[:beneficiary][:name],
            "bankId": original_body[:beneficiary][:bankId],
            "agency": original_body[:beneficiary][:agency],
            "agencyDigit": '',
            "account": original_body[:beneficiary][:account],
            "accountDigit": original_body[:beneficiary][:accountDigit],
            "accountType": original_body[:beneficiary][:accountType]
          },
          "value": original_body[:value]
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

    # TED ONLINE

    def bankTransfersCashout(original_body)
      body =
        {
          "accountId": original_body[:idOriginAccount],
          "sourceBankNumber": original_body[:sourceBankNumber],
          "beneficiary": {
            "type": original_body[:beneficiary][:type],
            "name": original_body[:beneficiary][:name],
            "nationalRegistration": original_body[:beneficiary][:docIdCpfCnpjEinSSN],
            "bankNumber": original_body[:beneficiary][:bankId],
            "bankBranchNumber": original_body[:beneficiary][:agency],
            "bankBranchDigit": original_body[:beneficiary][:agency].last,
            "bankAccountNumber": original_body[:beneficiary][:account],
            "bankAccountDigit": original_body[:beneficiary][:accountDigit],
            "bankAccountType": original_body[:beneficiary][:accountType].upcase,
            "accountId": original_body[:beneficiary][:idBeneficiaryAccount]
          },
          "amount": original_body[:value],
          "description": original_body[:description],
          "transferType": 3
        }
      @url = @url.include?('hml') ? URL_CUSTOM_TRANSFER_HML : URL_CUSTOM_TRANSFER
      response = @request.post(@url + PAY_CASHOUT, body, true)
      transferResponse = CdtModel.new(response)
      generateResponse(transferResponse)
    end

    def bankTransfersCancelCashout(id_transaction)
      body = {
        "transactionId": id_transaction
      }
      @url = @url.include?('hml') ? URL_CUSTOM_TRANSFER_HML : URL_CUSTOM_TRANSFER
      response = @request.post(@url + CASHOUT_CANCEL)
      transferResponse = CdtModel.new(response, body, true)
      generateResponse(transferResponse)
    end

    def getBankTransfersCashout(account, limit = 20, page = 0)
      @url = @url.include?('hml') ? URL_CUSTOM_TRANSFER_HML : URL_CUSTOM_TRANSFER
      response = @request.get(@url + TRANSACTIONS_CASHOUT + "?accountId=#{account}&limit=#{limit}&page=#{page}")
      transferResponse = response
      generateResponse(transferResponse)
    end

    def getBankTransfersReceiptCashout(id)
      @url = @url.include?('hml') ? URL_CUSTOM_TRANSFER_HML : URL_CUSTOM_TRANSFER
      response = @request.get(@url + RECEIPT_CASHOUT + id.to_s)
      transferResponse = response
      generateResponse(transferResponse)
    end
  end
end
