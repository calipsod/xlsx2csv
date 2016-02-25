class Xlsx2Csv::Document
  def initialize(filename)
    @filename = filename
    cleanup
  end

  def strings
    extract!
    strings_filename = File.join(tmpdir, 'xl', 'sharedStrings.xml')
    if File.exists?(strings_filename) #FIXME
      Xlsx2Csv::Strings::File.new(strings_filename)
    else
      []
    end
  end

  def worksheet(name = nil)
    extract!
    name =
      if name.nil?
        Dir.entries(File.join(tmpdir, 'xl', 'worksheets'))[2] # First entry
      else
        "#{name.downcase}.xml"
      end
    sheet_filename = File.join(tmpdir, 'xl', 'worksheets', name)
    Xlsx2Csv::Sheet::File.new(sheet_filename, strings.to_a)
  end

  def cleanup
    FileUtils.remove_dir(tmpdir) if Dir.exists?(tmpdir)
  end

  def self.open(filename)
    document = new(filename)
    begin
      yield(document)
    ensure
      document.cleanup
    end
  end

private

  def tmpdir
    @_tmpdir ||= File.join(Dir.tmpdir, "#{File.basename(@filename)}.d")
  end

  def extract!
    return true if Dir.exists?(tmpdir)
    command = "unzip #{@filename} xl/worksheets/\*.xml xl/\*.xml -d #{tmpdir} > /dev/null"
    system(command) || fail("Unable to extract #{@filename} to #{tmpdir}")
  end
end
