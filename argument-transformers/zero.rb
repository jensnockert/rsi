module RSI::ArgumentTransformer
  class Zero < RSI::ArgumentTransformer::Transformer
    def to_rust_argument
      nil
    end
    
    def to_c_type
      "*mut #{self.argument.c_type}"
    end

    def to_c_call_argument
      "&mut #{self.argument.value}"
    end

    def to_preparation_code(indent)
      self.crate.print("let mut #{self.argument.name}:#{self.argument.type} = std::unstable::intrinsics::init();", indent)
    end
  end
end