.separator ","

CREATE TABLE attributes (
    product_uid INTEGER,
    name TEXT,
    value TEXT);

CREATE TABLE product_descriptions (
    product_uid INTEGER PRIMARY KEY,
    product_description TEXT);

CREATE TABLE train (
    id INTEGER PRIMARY KEY,
    product_uid INTEGER,
    product_title TEXT,
    search_term TEXT,
    relevance NUMERIC);

CREATE TABLE test (
    id INTEGER PRIMARY KEY,
    product_uid INTEGER,
    product_title TEXT,
    search_term TEXT);

.import "working/noHeader/attributes.csv" attributes
.import "working/noHeader/product_descriptions.csv" product_descriptions
.import "working/noHeader/train.csv" train
.import "working/noHeader/test.csv" test

CREATE INDEX attributes_productuid_idx          ON attributes           (product_uid);
CREATE INDEX productdescriptions_productuid_idx ON product_descriptions (product_uid);
CREATE INDEX train_productuid_idx               ON train                (product_uid);
CREATE INDEX test_productuid_idx                ON test                 (product_uid);
