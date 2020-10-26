module CdtBaas
  class CdtPaymentSplip < CdtModule
    def initialize(token, env)
      startModule(token, env)
    end

    def create_recharge(body, version = 1)
      @url = @url.gsub('api.', 'paymentslip.')
      path = "v#{version}/#{PAYMENT_SLIP_RECHARGE}"
      @request.postWithHeader(@url + path, body, [{ key: 'Content-Type', value: 'application/json' }])
    end

    def recharges(body, version = 1)
      @url = @url.gsub('api.', 'paymentslip.')
      path = "v#{version}/#{PAYMENT_SLIP_RECHARGE}"
      @request.get(@url + path + CdtHelper.conductorBodyToString(body))
    end

    def create_invoice(params, version = 1)
      @url = @url.gsub('api.', 'paymentslip.')
      path = "v#{version}/#{PAYMENT_SLIP_INVOICE}"
      path = path + CdtHelper.conductorBodyToString(params[:query_params]) if params[:query_params]
      params = params[:body_params]
      @request.postWithHeader(@url + path, params, [{ key: 'Content-Type', value: 'application/json' }])
    end

    def invoices(body, version = 1)
      @url = @url.gsub('api.', 'paymentslip.')
      path = "v#{version}"
      @request.get(@url + path + CdtHelper.conductorBodyToString(body))
    end

    def get_pdf(body, version = 1)
      @url = @url.gsub('api.', 'paymentslip.')
      path = "v#{version}/pdf"
      @request.get(@url + path + CdtHelper.conductorBodyToString(body))
    end
  end
end
