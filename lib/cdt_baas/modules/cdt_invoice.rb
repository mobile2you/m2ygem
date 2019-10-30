module CdtBaas

	class CdtInvoice < CdtModule

	     def initialize(token, env)
	        startModule(token, env)
	     end

	 	 def getInvoices(body)
	         response = @request.get(@url + INVOICES_PATH + CdtHelper.conductorBodyToString(body))
			 invoice = CdtModel.new(response)
			 generateResponse(invoice)
	     end

		 def createInvoice(body)
			response = @request.post(@url + INVOICES_PATH, body, true)
			invoice = CdtModel.new(response)
			generateResponse(invoice)
	     end

	     def findInvoice(id)
	         response = @request.get(@url + INVOICES_PATH + id.to_s)
	         invoice = CdtModel.new(response)
	         generateResponse(invoice)
	     end


	     def registerInvoice(id)
	         response = @request.post(@url + INVOICES_PATH + id.to_s + "/" + INVOICE_REGISTER_PATH, {})
	         invoice = CdtModel.new(response)
	         generateResponse(invoice)
	     end

	     def printInvoice(id)
	         response = @request.get(@url + INVOICES_PATH + id.to_s + "/" + INVOICE_PRINT_PATH)
	         invoice = CdtModel.new(response)
	         generateResponse(invoice)
	     end


 	end

end