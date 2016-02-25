class Xlsx2Csv::Strings::File
  include Enumerable

  def initialize(filename)
    @filename = filename
  end

  def each(&block)
    File.open(@filename) do |f|
      Ox.sax_parse(Xlsx2Csv::Strings::RowParser.new(&block), f)
    end
  end
end
