FROM rabbitmq:3-management

RUN adduser rabbit

COPY erlang.cookie /var/lib/rabbitmq/.erlang.cookie
COPY cluster-entrypoint.sh /usr/local/bin/cluster-entrypoint.sh

RUN chown rabbit:rabbit /var/lib/rabbitmq/.erlang.cookie
RUN chmod 600 /var/lib/rabbitmq/.erlang.cookie

USER rabbit

ENTRYPOINT /usr/local/bin/cluster-entrypoint.sh
