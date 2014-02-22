module RSI
  class CloneTransformer
    attr_reader :result

    def initialize(result)
      @result = result
    end

    def needs_foreign_result
      true
    end

    def to_rust_result
      "foreign_result.clone()"
    end

    def to_rust_result_type
      "#{self.result.type}"
    end

    def to_c_result_type
      "#{self.result.type}"
    end

    def to_postparation_code(indent)
      nil
    end
  end
end