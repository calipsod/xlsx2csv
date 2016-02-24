require 'rubygems'
require 'bundler'
require 'csv'
require 'tmpdir'
require 'ox'

require 'xlsx2csv/version'
require 'xlsx2csv/row_parser'
require 'xlsx2csv/reader'
require 'xlsx2csv/csv_writer'

module Xlsx2Csv
  def self.convert(options)
    reader = Xlsx2Csv::Reader.new(options[:file], options[:sheet])
    Xlsx2Csv::CsvWriter.new(reader).write(options[:out])
  end
end
