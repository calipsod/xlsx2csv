# xlsx2csv

```
Usage: xlsx2csv [options]
    -f, --file   source XLSX file (required)
    -o, --out    output file name
    -s, --sheet  worksheet name to convert (first by default)

Examples:
    xlsx2csv -f some.xlsx
    xlsx2csv -f some.xlsx -o /dev/null
```
## Installation
```sh
git clone git@github.com:abmcloud/xlsx2csv.git
cd xlsx2csv
gem build xlsx2csv.gemspec
gem install gem install xlsx2csv-X.X.X.gem
```
