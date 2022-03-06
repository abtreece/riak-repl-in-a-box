FROM amazonlinux:latest
FROM --platform=linux/amd64 amazonlinux:latest

ENV OS_FAMILY centos
ENV OS_VERSION 7

ENV RIAK_VERSION 2.9.10
ENV RIAK_HOME /usr/lib64/riak
ENV RIAK_FLAVOR KV

COPY update.sh /tmp/update.sh
RUN chmod a+x /tmp/update.sh && /tmp/update.sh
RUN yum install -y https://files.tiot.jp/riak/kv/2.9/2.9.10/amazon/2/riak-2.9.10-1.amzn2.x86_64.rpm

# Install Riak Explorer
RUN curl -sSL https://github.com/basho-labs/riak_explorer/releases/download/1.4.1/riak_explorer-1.4.1.patch-centos-7.tar.gz | tar -zxf - -C $RIAK_HOME --strip-components 2
RUN for f in riak_pb riak_kv riak_ts riak_dt riak_search riak_yokozuna;do rm -f $RIAK_HOME/lib/basho-patches/$f*; done

# Expose default ports
EXPOSE 8087
EXPOSE 8098

# Expose volumes for data and logs
VOLUME /var/log/riak
VOLUME /var/lib/riak

# Install custom start script
COPY riak-cluster.sh $RIAK_HOME/riak-cluster.sh
RUN chmod a+x $RIAK_HOME/riak-cluster.sh
# Install custom hooks
COPY prestart.d /etc/riak/prestart.d
COPY poststart.d /etc/riak/poststart.d

# Prepare for bootstrapping schemas
RUN mkdir -p /etc/riak/schemas

WORKDIR /var/lib/riak

CMD ["/usr/lib64/riak/riak-cluster.sh"]

# Clean up 
RUN rm -rf /var/lib/riak/ring/* /tmp/*
