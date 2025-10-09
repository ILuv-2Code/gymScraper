import time
import csv
from selenium import webdriver
from selenium.webdriver.chrome.options import Options



# Configure Chrome options
chrome_options = Options()
chrome_options.add_argument("--log-level=3") # Suppress logs
chrome_options.add_experimental_option("excludeSwitches", ["enable-logging"]) # Suppress DevTools logs

driver = webdriver.Chrome(options=chrome_options)
driver.get("https://app.safespace.io/api/display/live-occupancy/86fb9e11")  # <-- not the API, the real page with the span

# To Save Cords
class coordinates: 
    def __init__(self):
    
        try:
            with open("cordGraph.csv", "x", newline='') as cordFile:
                writer = csv.writer(cordFile)
                writer.writerow(["Month", "Day", "Day_of_Week" ,"Time", "Occupancy"])
        except:
            print("cordGraph.csv present")
              
    def saveCord(xCord, yCord):
        with open("cordGraph.csv", "a", newline='') as cordFile:
            month = xCord.split()[1]
            day = xCord.split()[2]
            day_of_week = xCord.split()[0]
            time = xCord.split()[3]
            writer = csv.writer(cordFile)
            writer.writerow([month, day, day_of_week, time, yCord])
        
 
# Driver
try:
    elem = driver.find_element("id", "occupants")
    coordinates.saveCord(time.ctime(), elem.text)
        
        # print(elem.text)
except:
    with open("cordGraph.csv", "a", newline='') as cordFile:
        writer = csv.writer(cordFile)
        writer.writerow(["Error", "Failed to Pull Data at " + time.ctime()])
    
driver.quit()
