import urllib2
from bs4 import BeautifulSoup
import re

class Scrapper:

	def start_soup(self, sourceUrl):
		opener = urllib2.build_opener()
		headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 5.1; rv:10.0.1) Gecko/20100101 Firefox/10.0.1',}
		opener.addheaders = headers.items()
		response = opener.open(sourceUrl)
		soup = BeautifulSoup(response, 'html.parser')
		return soup

	def get_all_links(self, soup):
		links = soup.find_all('a')
		return links

	def get_all_pages(self, soup):
		pages = soup.find("div", {"class":"pager"})
		page = pages.text
		pageCount = int(re.search(r'of ([\d]+) ', page).group(1)) / 30 + 1
		return pageCount

	def get_product_link(self, sourceUrl, pageCount):
		productLinksList = [];

		for pageUrl in range(1, pageCount+1):
			opener = urllib2.build_opener()
			headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 5.1; rv:10.0.1) Gecko/20100101 Firefox/10.0.1',}
			opener.addheaders = headers.items()
			response = opener.open(sourceUrl+"?p="+str(pageUrl))
			soup = BeautifulSoup(response, 'html.parser')

			# productLink = soup.find("div", {"class":"category-products"})
			for a in soup.findAll('a',{"class":"product-image"}):
				productLinks = a['href']
				productLinksList.append(productLinks);

		return productLinksList

	def get_product_name(self, sourceUrl):
		opener = urllib2.build_opener()
		headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 5.1; rv:10.0.1) Gecko/20100101 Firefox/10.0.1',}
		opener.addheaders = headers.items()
		response = opener.open(sourceUrl)
		soup = BeautifulSoup(response, 'html.parser')

		try:
			productName = soup.find("div", {"class":"product-name"})
			productNames = productName.find("h1").getText()
			return productNames
		except:
			pass
