'''
import confluent_kafka.admin, pprint
conf        = {'bootstrap.servers': 'dkfkrpl01.atd-us.icd:9092'}
kafka_admin = confluent_kafka.admin.AdminClient(conf)
print(kafka_admin.list_topics().topics)
print(kafka_admin.list_topics().topics)
pprint.pprint(kafka_admin.list_topics().brokers)
'''
'''
from confluent_kafka import Producer
p = Producer({'bootstrap.servers': 'dkfkrpl01.atd-us.icd:9092'})


#p.produce('test', key='hello', value='world')
dic = p.list_topics()
#print(int(dic.controller_id()))
print(dic)
#p.flush(30)
'''

from confluent_kafka import Producer
import json

credentials=[]
with open("credentials.txt", "r") as f: 
	for i, line in enumerate(f):
		credentials.append(line.split(','))
		credentials[i][-1] = credentials[i][-1].strip()
print(credentials)

jsond = None
with open('samplejson.json') as json_file:  
    data = json.load(json_file)
    jsond = json.dumps(data)

def acked(err, msg):
    if err is not None:
        print("Failed to deliver message: {0}: {1}".format(msg.value(), err.str()))
    else:
    	pass
        #print("Message produced: {0}".format(msg.value()))

p = Producer({'bootstrap.servers': credentials[0][0]})

try:
	#print(data)
	p.produce(credentials[0][1], jsond, callback=acked)
	p.poll(0.5)
except KeyboardInterrupt:
    pass

p.flush(30)


'''
    for val in range(1, 10):
        p.produce(credentials[0][1], 'myvalue #{0}'.format(val), callback=acked)
        p.poll(0.5)
'''