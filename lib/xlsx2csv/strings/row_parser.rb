module Xlsx2Csv::Strings
  class RowParser < ::Ox::Sax
    def initialize(&block)
      @block = block
    end

    def start_element(name)
      @element_name = name
    end

    def value(value)
      @block.call(value.as_s)if @element_name == :t
    end
  end
end
