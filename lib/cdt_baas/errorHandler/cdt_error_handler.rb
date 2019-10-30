module ErrorEnum
    UnknownError = 0
    InputError = 1
    NotFound = 2
    BadRequest = 3
end

module CdtMappedErrors
    InputError = "MethodArgumentNotValidException"
    NotFoundPIER = "NotFoundExceptionPIER"
    BadRequestPIER = "BadRequestExceptionPIER"
end

module CdtBaas
    class CdtErrorHandler
        attr_accessor :errorType, :message, :reasons, :status, :cdtStatus

        def initialize()
            @errorType = nil
            @message = ""
            @reasons = []
            @status = 400
            @cdtStatus = 0
        end

        def to_json()
            json = {
                errorType: @errorType,
                message: @message,
                reasons: @reasons,
                status: @status,
                cdtStatus: @cdtStatus
            }
            json
        end

        def mapErrorType(cdtResponse)
            @message = ""
            @errorType = nil
            hasError = false
            
            if cdtResponse.class == Hash
                if !cdtResponse['exception'].nil?
                    hasError = true
                    @message = cdtResponse['exception']
                    case cdtResponse['exception']
                    when CdtMappedErrors::InputError
                        @errorType = ErrorEnum::InputError
                        @status = 422
                    when CdtMappedErrors::NotFoundPIER
                        @errorType = ErrorEnum::NotFound
                        @status = 404
                    when CdtMappedErrors::BadRequestPIER
                        @errorType = ErrorEnum::BadRequest
                        @status = 400
                    else
                        @errorType = ErrorEnum::UnknownError
                    end
                    if !cdtResponse[:code].nil?
                        @cdtStatus = cdtResponse[:code]
                    elsif !cdtResponse[:status].nil?
                        @cdtStatus = cdtResponse[:status]
                    end
                    generateReasons(cdtResponse)
                elsif !cdtResponse[:message].nil? and !cdtResponse[:message].downcase.include? "success"
                    hasError = true
                    @message = cdtResponse[:message]
                elsif !cdtResponse[:error].nil?
                    hasError = true
                    @message = cdtResponse[:message]
                    generateReasons(cdtResponse)
                    @errorType = ErrorEnum::UnknownError
                end
            end
            hasError
        end

        def generateReasons(cdtResponse)
            @reasons = []
            if !cdtResponse[:erros].nil?
                cdtResponse[:erros].each do |error|
                    reasonMessage = ""
                    if !error["field"].nil?
                        reasonMessage += error["field"]
                    end
                    if !error["defaultMessage"].nil?
                        reasonMessage += " " + error["defaultMessage"]
                    end
                    # puts error["code"]
                    reason = { message: reasonMessage, cdtCode: error["code"] }
                    @reasons << reason
                end
            elsif !cdtResponse[:message].nil?
                @reasons << cdtResponse[:message]
            elsif !cdtResponse[:error].nil?
                @reasons << cdtResponse[:error]
            end
        end
    end
end



