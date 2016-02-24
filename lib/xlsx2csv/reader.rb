class Xlsx2Csv::Reader
  attr_reader :filename

  def initialize(filename, worksheet = nil)
    @filename = filename
    @worksheet = worksheet
  end

  def tmpdir
    @_tmpdir = "#{Dir.tmpdir}/#{File.basename(@filename)}.d"
  end

  def unzip
    `rm -r #{tmpdir}; unzip #{@filename} xl/worksheets/*.xml -d #{tmpdir}`
  end

  def each_row(&block)
    fail "File not exists: #{@filename}" unless File.exists?(@filename)

    unzip
    sheet = Dir.entries("#{tmpdir}/xl/worksheets")[2]
    File.open("#{tmpdir}/xl/worksheets/#{sheet}") do |f|
      Ox.sax_parse(Xlsx2Csv::RowParser.new(&block), f)
    end
  end
end

