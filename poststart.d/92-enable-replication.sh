#!/bin/bash

# Name the cluster
if [[ "$($RIAK_ADMIN cluster status | egrep $COORDINATOR_NODE_HOST)" && "$COORDINATOR_NODE_HOST" == "$HOST" ]]; then
  curl -sSL $HOST:8098/admin/control/clusters/default/repl-clustername/$CLUSTER_NAME
  curl -sSL $HOST:8098/admin/control/clusters/default/repl-fullsync-enable/$REPL_CLUSTER_NAME
  curl -sSL $HOST:8098/admin/control/clusters/default/repl-realtime-enable/$REPL_CLUSTER_NAME
  curl -sSL $HOST:8098/admin/control/clusters/default/repl-fullsync-start/$REPL_CLUSTER_NAME
  curl -sSL $HOST:8098/admin/control/clusters/default/repl-realtime-start/$REPL_CLUSTER_NAME  
fi
