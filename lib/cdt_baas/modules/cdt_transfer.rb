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
          "agencyDigit": "",
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

    #TED ONLINE

    def bankTransfersCashout(original_body)
      body =
      {
        "accountId": original_body[:accountId],
        "sourceBankNumber": original_body[:sourceBankNumber],
        "beneficiary": {
          "type": original_body[:beneficiary][:type],
          "name": original_body[:beneficiary][:name],
          "nationalRegistration": original_body[:beneficiary][:nationalRegistration],
          "bankNumber": original_body[:beneficiary][:bankNumber],
          "bankBranchNumber": original_body[:beneficiary][:bankBranchNumber],
          "bankBranchDigit": original_body[:beneficiary][:bankBranchDigit],
          "bankAccountNumber": original_body[:beneficiary][:bankAccountNumber],
          "bankAccountDigit": original_body[:beneficiary][:bankAccountDigit],
          "bankAccountType": original_body[:beneficiary][:bankAccountType],
          "accountId": original_body[:beneficiary][:accountId]
        },
        "amount": original_body[:amount],
        "description": original_body[:description],
        "transferType": original_body[:type]
      }
      response = @request.post(@url + PAY_CASHOUT, body, true)
      transferResponse = CdtModel.new(response)
      generateResponse(transferResponse)
    end

    def bankTransfersCancelCashout(id_transaction)
      body = {
        "transactionId": id_transaction
      }
      response = @request.post(@url + CASHOUT_CANCEL)
      transferResponse = CdtModel.new(response, body, true)
      generateResponse(transferResponse)
    end

    def getBankTransfersCashout()
      response = @request.get(@url + TRANSACTIONS_CASHOUT)
      transferResponse = response
      generateResponse(transferResponse)
    end

    def getBankTransfersReceiptCashout(id)
      response = @request.get(@url + RECEIPT_CASHOUT + id.to_s)
      transferResponse = response
      generateResponse(transferResponse)
    end

  end
end
