<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>ContentFilters</key>
	<dict/>
	<key>auto_connect</key>
	<true/>
	<key>data</key>
	<dict>
		<key>connection</key>
		<dict>
			<key>database</key>
			<string>publications</string>
			<key>host</key>
			<string>127.0.0.1</string>
			<key>kcid</key>
			<string>-7797908538145738884</string>
			<key>name</key>
			<string>localhost</string>
			<key>rdbms_type</key>
			<string>mysql</string>
			<key>sslCACertFileLocation</key>
			<string></string>
			<key>sslCACertFileLocationEnabled</key>
			<integer>0</integer>
			<key>sslCertificateFileLocation</key>
			<string></string>
			<key>sslCertificateFileLocationEnabled</key>
			<integer>0</integer>
			<key>sslKeyFileLocation</key>
			<string></string>
			<key>sslKeyFileLocationEnabled</key>
			<integer>0</integer>
			<key>type</key>
			<string>SPTCPIPConnection</string>
			<key>useSSL</key>
			<integer>0</integer>
			<key>user</key>
			<string>root</string>
		</dict>
		<key>session</key>
		<dict>
			<key>connectionEncoding</key>
			<string>utf8</string>
			<key>contentFilterV2</key>
			<dict>
				<key>children</key>
				<array/>
				<key>filterClass</key>
				<string>groupNode</string>
				<key>isConjunction</key>
				<true/>
			</dict>
			<key>contentPageNumber</key>
			<integer>1</integer>
			<key>contentSelection</key>
			<data>
			YnBsaXN0MDDUAQIDBAUGBwpYJHZlcnNpb25ZJGFyY2hpdmVyVCR0
			b3BYJG9iamVjdHMSAAGGoF8QD05TS2V5ZWRBcmNoaXZlctEICVRk
			YXRhgAGoCwwXGBkaHiVVJG51bGzTDQ4PEBMWV05TLmtleXNaTlMu
			b2JqZWN0c1YkY2xhc3OiERKAAoADohQVgASABYAHVHR5cGVUcm93
			c18QHVNlbGVjdGlvbkRldGFpbFR5cGVOU0luZGV4U2V00hsPHB1c
			TlNSYW5nZUNvdW50EACABtIfICEiWiRjbGFzc25hbWVYJGNsYXNz
			ZXNaTlNJbmRleFNldKIjJFpOU0luZGV4U2V0WE5TT2JqZWN00h8g
			JidcTlNEaWN0aW9uYXJ5oiYkAAgAEQAaACQAKQAyADcASQBMAFEA
			UwBcAGIAaQBxAHwAgwCGAIgAigCNAI8AkQCTAJgAnQC9AMIAzwDR
			ANMA2ADjAOwA9wD6AQUBDgETASAAAAAAAAACAQAAAAAAAAAoAAAA
			AAAAAAAAAAAAAAABIw==
			</data>
			<key>contentSortColIsAsc</key>
			<true/>
			<key>contentViewport</key>
			<string>{{0, 0}, {695, 481}}</string>
			<key>isToolbarVisible</key>
			<true/>
			<key>queries</key>
			<string>SELECT * FROM sales;
SELECT * FROM titles;
SELECT * FROM authors;
SELECT * FROM titleauthor;
SELECT * FROM tempTwo;
SELECT * FROM tempThree;
SELECT * FROM tempFour;

# Step 1A: Get information ready to calculate royalties
CREATE TEMPORARY TABLE tempOne
SELECT sales.title_id, titleauthor.au_id, titleauthor.royaltyper, sales.qty, titles.price, titles.royalty
FROM sales
LEFT JOIN titles ON sales.title_id = titles.title_id
LEFT JOIN titleauthor ON sales.title_id = titleauthor.title_id;

# Step 1B: Calculate royalties per author per title
CREATE TEMPORARY TABLE tempTwo
SELECT title_id, au_id, (price*qty)*(royalty/100)*(royaltyper/100) as 'royaltyTotal'
FROM tempOne;

# Step 2: Aggregate thte total royalties for each title for each author
CREATE TEMPORARY TABLE tempThree
SELECT title_id, au_id, sum(royaltyTotal) as 'royalty'
FROM tempTwo
GROUP BY au_id, title_id;

# Step 3A: Profit per title per author
CREATE TEMPORARY TABLE tempFour
SELECT tempThree.title_id, tempThree.au_id, tempThree.royalty, tempThree.royalty+(titles.advance*(titleauthor.royaltyper/100)) as 'profit'
FROM tempThree
LEFT JOIN titles ON tempThree.title_id = titles.title_id
LEFT JOIN titleauthor ON tempThree.title_id = titleauthor.title_id;

# Get final answer
SELECT au_id, sum(profit) as 'totalProfit'
FROM tempFour
GROUP BY au_id
ORDER BY totalProfit DESC
LIMIT 3;</string>
			<key>view</key>
			<string>SP_VIEW_CUSTOMQUERY</string>
			<key>windowVerticalDividerPosition</key>
			<real>186.5</real>
		</dict>
	</dict>
	<key>encrypted</key>
	<false/>
	<key>format</key>
	<string>connection</string>
	<key>queryFavorites</key>
	<array/>
	<key>queryHistory</key>
	<array>
		<string>SELECT au_id, sum(profit) as 'totalProfit'
FROM tempFour
GROUP BY au_id
ORDER BY totalProfit DESC
LIMIT 3</string>
		<string>SELECT * FROM tempThree</string>
		<string>SELECT au_id, sum(profit) as 'totalProfit'
FROM tempFour
GROUP BY au_id
ORDER BY totalProfit DESC</string>
		<string>SELECT au_id, sum(profit) as 'totalProfit'
FROM tempFour
GROUP BY totalProfit
ORDER BY totalProfit DESC</string>
		<string>SELECT * FROM tempTwo</string>
		<string># Step 3A: Profit per title per author
CREATE TEMPORARY TABLE tempFour
SELECT tempThree.title_id, tempThree.au_id, tempThree.royalty, tempThree.royalty+(titles.advance*(titleauthor.royaltyper/100)) as 'profit'
FROM tempThree
LEFT JOIN titles ON tempThree.title_id = titles.title_id
LEFT JOIN titleauthor ON tempThree.title_id = titleauthor.title_id</string>
		<string># Step 2: Aggregate thte total royalties for each title for each author
CREATE TEMPORARY TABLE tempThree
SELECT title_id, au_id, sum(royaltyTotal) as 'royalty'
FROM tempTwo
GROUP BY au_id, title_id</string>
		<string># Step 1B: Calculate royalties per author per title
CREATE TEMPORARY TABLE tempTwo
SELECT title_id, au_id, (price*qty)*(royalty/100)*(royaltyper/100) as 'royaltyTotal'
FROM tempOne</string>
		<string># Step 1A: Get information ready to calculate royalties
CREATE TEMPORARY TABLE tempOne
SELECT sales.title_id, titleauthor.au_id, titleauthor.royaltyper, sales.qty, titles.price, titles.royalty
FROM sales
LEFT JOIN titles ON sales.title_id = titles.title_id
LEFT JOIN titleauthor ON sales.title_id = titleauthor.title_id</string>
		<string>ORDER BY totalProfit DESC</string>
		<string>SELECT au_id, sum(profit)
FROM tempFour
GROUP BY au_id</string>
		<string>SELECT * FROM tempFour</string>
		<string># Step 3A: Profit per title per author
CREATE TEMPORARY TABLE tempFour
SELECT tempThree.title_id, tempThree.au_id, tempThree.royalty, tempThree.royalty+(titles.advance*titleauthor.royaltyper) as 'profit'
FROM tempThree
LEFT JOIN titles ON tempThree.title_id = titles.title_id
LEFT JOIN titleauthor ON tempThree.title_id = titleauthor.title_id</string>
		<string># Step 3:
SELECT tempThree.title_id, tempThree.au_id, tempThree.royalty, tempThree.royalty+(titles.advance*titleauthor.royaltyper) as 'profit'
FROM tempThree
LEFT JOIN titles ON tempThree.title_id = titles.title_id
LEFT JOIN titleauthor ON tempThree.title_id = titleauthor.title_id</string>
		<string># Step 3:
SELECT tempThree.title_id, tempThree.au_id, tempThree.royalty, royalty+(titles.advance*titleauthor.royaltyper) as 'profit'
FROM tempThree
LEFT JOIN titles ON tempThree.title_id = titles.title_id
LEFT JOIN titleauthor ON tempThree.title_id = titleauthor.title_id</string>
		<string># Step 3:
SELECT tempThree.title_id, tempThree.au_id, tempThree.appsroyalty, royalty+(titles.advance*titleauthor.royaltyper) as 'profit'
FROM tempThree
LEFT JOIN titles ON tempThree.title_id = titles.title_id
LEFT JOIN titleauthor ON tempThree.title_id = titleauthor.title_id</string>
		<string># Step 3:
SELECT tempThree.title_id, tempThree.au_id, royalty, royalty+(titles.advance*titleauthor.royaltyper) as 'profit'
FROM tempThree
LEFT JOIN titles ON tempThree.title_id = titles.title_id
LEFT JOIN titleauthor ON tempThree.title_id = titleauthor.title_id</string>
		<string># Step 3:
SELECT tempThree.title_id, au_id, royalty, royalty+(titles.advance*titleauthor.royaltyper) as 'profit'
FROM tempThree
LEFT JOIN titles ON tempThree.title_id = titles.title_id
LEFT JOIN titleauthor ON tempThree.title_id = titleauthor.title_id</string>
		<string># Step 3:
SELECT title_id, au_id, royalty, royalty+(titles.advance*titleauthor.royaltyper) as 'profit'
FROM tempThree
LEFT JOIN titles ON tempThree.title_id = titles.title_id
LEFT JOIN titleauthor ON tempThree.title_id = titleauthor.title_id</string>
		<string>SELECT * FROM titleauthor</string>
	</array>
	<key>rdbms_type</key>
	<string>mysql</string>
	<key>rdbms_version</key>
	<string>8.0.18</string>
	<key>version</key>
	<integer>1</integer>
</dict>
</plist>
