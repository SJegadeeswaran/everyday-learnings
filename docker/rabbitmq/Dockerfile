FROM rabbitmq
LABEL maintainer="jegadeeswaran.s@xxxx.com"
ENV RABBITMQ_USER rabbitmq
ENV RABBITMQ_PASSWORD rabbitmq
ENV RABBITMQ_PID_FILE /var/lib/rabbitmq/mnesia/rabbitmq

ADD setup.sh /setup.sh
RUN chmod +x /setup.sh
EXPOSE 15672

# Define default command
CMD ["/setup.sh"]
