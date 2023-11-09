from confluent_kafka import Producer
import logging, json

logging.basicConfig(level=logging.INFO, format='%(asctime)s-%(name)s-%(levelname)s-%(message)s')
logger = logging.getLogger(__name__)

class Kafka_Util():
    def __init__(self, kakfa_config_str: str):
        self.kakfa_config_str = kakfa_config_str

    def send_message(
        self,
        msg_content: str,
        topic: str
    ):

        def acked(err, msg):
            if err is not None:
                logger.info("Failed to deliver message: %s: %s" % (str(msg), str(err)))
            else:
                logger.info("Message produced: %s" % (str(msg)))

        conf = json.loads(self.kakfa_config_str)

        producer = Producer(conf)
        try:
            logger.info("Try to send message to topic: {}".format(topic))
            producer.produce(topic, value=msg_content, callback=acked)
            producer.flush(30)
        except Exception as e:
            logger.error("Can not send message to kafka.", e)
        
        