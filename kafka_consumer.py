from kafka import KafkaConsumer

credentials=[]
with open("credentials.txt", "r") as f: 
	for i, line in enumerate(f):
		credentials.append(line.split(','))
		credentials[i][-1] = credentials[i][-1].strip()
print(credentials)

consumer = KafkaConsumer(credentials[0][1], auto_offset_reset='earliest',
                             bootstrap_servers=[credentials[0][0]], consumer_timeout_ms=1000)

for msg in consumer:
        print(msg.value)

'''
dict = consumer.poll(500)

for key, value in dict.items():
    #print(key)
    print(value[:10])
    for record in value:
        print(record)
        print()        
 '''      
consumer.close()