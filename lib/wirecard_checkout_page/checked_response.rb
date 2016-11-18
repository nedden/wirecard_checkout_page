module WirecardCheckoutPage
  class CheckedResponse

    def initialize(params)
      @params = params.stringify_keys.freeze
    end

    attr_reader :params

    def valid?
      WirecardCheckoutPage::ResponseChecksum.new(@params).valid?
    end

    def success?
      valid? && @params['paymentState'] == 'SUCCESS'
    end

    def message
      @params['message']
    end
  end
end
