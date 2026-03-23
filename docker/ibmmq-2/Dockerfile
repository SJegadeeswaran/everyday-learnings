FROM ibmcom/mq:9.2.0.0-r1
LABEL maintainer "xxxx@xxxx.com"
ENV LICENSE accept
ENV MQ_QMGR_NAME QM1
ENV MQ_ENABLE_METRICS true
ENV MQ_DEV true
ENV MQSNOAUT yes
COPY 20-config.mqsc /etc/mqm/
