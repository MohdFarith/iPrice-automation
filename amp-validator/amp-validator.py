import requests

u = "iprice.my/trends"
r = requests.get("https://amp.cloudflare.com/q/" + u)
validation = r.json()
if validation['valid']:
	print u, 'is valid'
else:
	print u, 'failed'
	# for e in validation['errors']:
	# 	print e