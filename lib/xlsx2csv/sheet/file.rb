class Xlsx2Csv::Sheet::File
  include Enumerable

  def initialize(filename, strings = [])
    @filename = filename
    @strings = strings
  end

  def each(&block)
    File.open(@filename) do |f|
      Ox.sax_parse(Xlsx2Csv::Sheet::RowParser.new(@strings, &block), f)
    end
  end
end
