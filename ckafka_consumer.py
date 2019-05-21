from confluent_kafka import Consumer, KafkaError,admin
import pprint
import json
import Oracletrxs

orcle = Oracletrxs.Kafka_trxs()
orcle.__enter__()

def parsejson(json_msg):
    keyval = json_msg['pos']
    print(keyval)
    record = json.dumps(json_msg)
    orcle.queue_msg(keyval,record)

credentials=[]
with open("credentials.txt", "r") as f: 
    for i, line in enumerate(f):
        credentials.append(line.split(','))
        credentials[i][-1] = credentials[i][-1].strip()
print(credentials)

settings = {
    'bootstrap.servers': credentials[0][0],
    'group.id': 'mygroup',
    'client.id': 'client-1',
    'enable.auto.commit': True,
    'session.timeout.ms': 6000,
    'default.topic.config': {'auto.offset.reset': 'smallest'}
}

kafka_admin = admin.AdminClient(settings)

c = Consumer(settings)

pprint.pprint(kafka_admin.list_topics().topics)

c.subscribe([credentials[0][1]])

try:
    while True:
        msg = c.poll(0.1)
        if msg is None:
            continue
        elif not msg.error():
            #print(jsondata)
            record = json.loads(msg.value())
            parsejson(record)
            #print('Received message: {0}, with length {1} {2} {3} {4} {5} {6}'.format(msg.value(),len(msg.value()),msg.key(),msg.timestamp(),msg.topic(),msg.partition(),msg.offset()))
        elif msg.error().code() == KafkaError._PARTITION_EOF:
            print('End of partition reached {0}/{1}'.format(msg.topic(), msg.partition()))
        else:
            print('Error occured: {0}'.format(msg.error().str()))

except KeyboardInterrupt:    
    pass

finally:
    orcle.__exit__()
    c.close()