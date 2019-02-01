#!/bin/bash

# Name the cluster
if [[ "$($RIAK_ADMIN cluster status | egrep $COORDINATOR_NODE_HOST)" && "$COORDINATOR_NODE_HOST" == "$HOST" ]]; then
  $RIAK_REPL clustername $CLUSTER_NAME
  sleep 2
  $RIAK_REPL connect $REPL_COORDINATOR_NODE:9080
  sleep 2
  $RIAK_REPL fullsync enable $REPL_CLUSTER_NAME
  $RIAK_REPL realtime enable $REPL_CLUSTER_NAME
  $RIAK_REPL fullsync start $REPL_CLUSTER_NAME
  $RIAK_REPL realtime start $REPL_CLUSTER_NAME
fi
