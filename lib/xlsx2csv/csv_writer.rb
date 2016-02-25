class Xlsx2Csv::CsvWriter
  def initialize(sheet)
    @sheet = sheet
  end

  def write(filename)
    CSV.open(filename, 'wb') do |csv|
      @sheet.each do |row|
        csv << row
      end
    end
  end
end
