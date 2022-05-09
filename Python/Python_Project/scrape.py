from bs4 import BeautifulSoup
import requests
from csv import writer

url = 'https://www.pararius.com/apartments/nederland/page-'

with open("house_info.csv", 'w', encoding='utf8', newline='') as f:
    thewriter = writer(f)
    header = ['Title', 'Location', 'Price', 'Area', 'Room']
    thewriter.writerow(header)

    for page in range(1,184):

        req = requests.get(url + str(page))
        soup = BeautifulSoup(req.content, 'html.parser')
        lists = soup.find_all('section', class_="listing-search-item")
        
        for list in lists:
            title = list.find("a", class_="listing-search-item__link--title").text.strip()
            location = list.find("div", class_="listing-search-item__location").text.strip()
            price = list.find("span", class_="listing-search-item__price").text.strip()
            living_area = list.find("span", class_="illustrated-features__description").text.strip()
            room = list.find("span", class_="illustrated-features__description").text.strip()
            info = [title, location, price, living_area, room]
            print(info)
            thewriter.writerow(info)

            

