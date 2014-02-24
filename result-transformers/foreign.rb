module RSI::ResultTransformer
  class Foreign < RSI::ResultTransformer::Transformer
    def to_rust_result
      case @result.pass_by
      when 'owned'
        "std::cast::transmute(foreign_result)"
      else
        "foreign_result"
      end
    end
  end
end