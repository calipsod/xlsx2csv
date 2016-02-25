require 'rubygems'
require 'bundler'
require 'csv'
require 'tmpdir'
require 'ox'

require 'xlsx2csv/version'
require 'xlsx2csv/strings/row_parser'
require 'xlsx2csv/strings/file'
require 'xlsx2csv/sheet/row_parser'
require 'xlsx2csv/sheet/file'
require 'xlsx2csv/document'
require 'xlsx2csv/csv_writer'

module Xlsx2Csv
  def self.convert(options)
    Xlsx2Csv::Document.open(options[:file]) do |document|
      sheet = document.worksheet(options[:sheet])
      filename = options[:out] || document.filename.sub(/(\..+)?$/, '.csv')
      Xlsx2Csv::CsvWriter.new(sheet).write(options[:out])
    end
  end
end
