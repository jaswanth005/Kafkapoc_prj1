import cx_Oracle

with open("credentialsfile.txt", "r") as f: 
    for i, line in enumerate(f):
        if i==0:
            credentials = line.split(',')
            credentials[-1] = credentials[-1].strip()

print(credentials)
  
class Kafka_trxs:
  def __enter__(self):
    self.__db = cx_Oracle.Connection(credentials[0])
    self.__cursor = self.__db.cursor()
    return self 
  
  def __exit__(self):
    self.__cursor.close()
    self.__db.close()
 
  def queue_msg(self, p_key, p_json_msg):
    self.__cursor.callproc("xxatd_kafka_queue_pkg.load_message",[p_key, p_json_msg]) 