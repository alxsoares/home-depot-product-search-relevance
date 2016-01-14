working/noHeader/attributes.csv: input/attributes.csv
	mkdir -p working/noHeader
	tail +2 $^ > $@

working/noHeader/product_descriptions.csv: input/product_descriptions.csv
	mkdir -p working/noHeader
	tail +2 $^ > $@

working/noHeader/train.csv: input/train.csv
	mkdir -p working/noHeader
	tail +2 $^ > $@

working/noHeader/test.csv: input/test.csv
	mkdir -p working/noHeader
	tail +2 $^ > $@

output/database.sqlite: working/noHeader/attributes.csv working/noHeader/product_descriptions.csv working/noHeader/train.csv working/noHeader/test.csv
	mkdir -p output
	-rm output/database.sqlite
	sqlite3 -echo $@ < src/import.sql
db: output/database.sqlite

all: db

clean:
	rm -rf working
	rm -rf output
