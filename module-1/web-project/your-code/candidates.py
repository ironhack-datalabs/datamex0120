import requests
from bs4 import BeautifulSoup
import re

def getSpanishPages(domain, linkPattern):

	# Create an empty set of pages to scrape
	pages = set()

	# Get the link from which all internal links will be scraped
	page = requests.get(domain + linkPattern)

	# Create beautfiful soup object of page from previous step
	bs = BeautifulSoup(page.content, 'html.parser')

	# Find all internal links that start with /es/issues
	links = bs.find_all('a', href=re.compile(linkPattern))


	# Go through links and add to empty set
	for link in links:
		if 'href' in link.attrs:
			newPage = link.attrs['href']
			pages.add(newPage)

	print(pages)

	# Append domain name to list of links
	pages = {domain + link for link in pages}

	return pages

def parseBernieIssue(url):
	
	# Get response and parse page
	pageToParse = requests.get(url)
	page = BeautifulSoup(pageToParse.content, 'html.parser')
	
	# Get main title, which is the first h2
	title = page.find('h2')
	print(title.get_text().strip())

	paragraphs = page.find_all(['p', 'b'])
	
	for paragraph in paragraphs:
		print(paragraph.get_text().strip())


def parseElizabethPage(url):
	
	pageToParse = requests.get(url)
	page = BeautifulSoup(pageToParse.content, 'html.parser')

	# Get paragraphs
	# Get the paragraphs in each page
	paragraphs = page.find_all('p')
	
	for paragraph in paragraphs:
		print(paragraph.get_text().strip())

def parseBiden():
	
	# Get the issues from Joe Biden
	pageToParse = requests.get("https://joebiden.com/es/la-vision-de-joe/")
	page = BeautifulSoup(pageToParse.content, 'html.parser')
	issues = page.find_all('div', 'issue')
	for issue in issues:
		title = issue.find('h3').get_text().strip()
		text = issue.find('p').get_text().strip()
		print("***TITLE")
		print(title)
		print("*****")
		print(text)


## Get bernie pages
berniePages = getSpanishPages('https://berniesanders.com', '/es/issues/')
for page in berniePages:
	parseBernieIssue(page)

elizabethPages = getSpanishPages('https://elizabethwarren.com', '/es/planes')
for page in elizabethPages:
	parseElizabethPage(page)

parseBiden()