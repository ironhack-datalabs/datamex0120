#articles.
import feedparser
import ssl

# Need to look into this issue more, this is monkey pathing
# https://stackoverflow.com/questions/28282797/feedparser-parse-ssl-certificate-verify-failed
ssl._create_default_https_context = ssl._create_unverified_context
url = 'https://elpais.com/tag/rss/estados_unidos/a/'

feedBurner = feedparser.parse(url)
feedBurner.keys()

for entry in feedBurner['entries']:
    print(entry['title'])
    print(entry['link'])

