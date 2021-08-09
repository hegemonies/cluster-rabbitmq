FROM rabbitmq:3.7-management

RUN adduser rabbit

COPY erlang.cookie /var/lib/rabbitmq/.erlang.cookie
COPY cluster-entrypoint.sh /usr/local/bin/cluster-entrypoint.sh

RUN chown rabbit:rabbit /var/lib/rabbitmq/.erlang.cookie && \
        chmod 600 /var/lib/rabbitmq/.erlang.cookie && \
        chmod +x /usr/local/bin/cluster-entrypoint.sh

# Does not work with users other than root :(
# USER rabbit

CMD /usr/local/bin/cluster-entrypoint.sh
