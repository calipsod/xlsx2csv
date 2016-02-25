RSpec.describe Xlsx2Csv::Document do
  describe '#strings' do
    it 'should read shared strings' do
      file = File.join(File.dirname(__FILE__), 'file/test.xlsx')
      described_class.open(file) do |document|
        expect(document.strings.to_a).to eq ['String', 'Foo bar']
      end
    end

    it 'should return an empty array if document has no strings' do
      file = File.join(File.dirname(__FILE__), 'file/test_no_strings.xlsx')
      described_class.open(file) do |document|
        expect(document.strings.to_a).to eq []
      end
    end
  end
end
