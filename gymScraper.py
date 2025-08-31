from selenium import webdriver
import time

driver = webdriver.Chrome()
driver.get("https://app.safespace.io/api/display/live-occupancy/86fb9e11")  # <-- not the API, the real page with the span



try:
    while True:
        elem = driver.find_element("id", "occupants")
        print(elem.text)
        time.sleep(5)  # poll every 5 seconds
except KeyboardInterrupt:
    print("Stopped by user.")
finally:
    driver.quit()