class Xlsx2Csv::CsvWriter
  def initialize(reader)
    @reader = reader
  end

  def write(filename = nil)
    filename ||= @reader.filename.sub(/(\..+)?$/, '.csv')

    CSV.open(filename, 'wb') do |csv|
      @reader.each_row do |row|
        csv << row
      end
    end
  end
end
