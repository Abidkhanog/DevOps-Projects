import requests

url = "http://15.206.48.53"

print(f"Checking {url}...")
response = requests.get(url)

if response.status_code == 200:
    print("Site is UP!")
else:
    print(" Site is DOWN!")

