class JsonWebToken
    class << self
    def encode(payload, exp = 3.days.from_now)
        payload[:exp] = exp.to_i
        JWT.encode(payload, "guainsurance")
    end

    def decode(token)
        body = JWT.decode(token, "guainsurance")[0]
        HashWithIndifferentAccess.new body
    rescue
        nil
    end
    end
end
# Rails.application.secrets.secret_key_base
