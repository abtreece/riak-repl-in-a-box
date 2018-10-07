riak-repl-in-a-box
==============

Provides a Docker environment which implements two riak clusters and configures replication between them.

Requirements
------------

-   [docker](https://www.docker.com/get-docker) 

Quick Start
-----------


Bring the environment up with `docker-compose`. Running in detached mode puts the sandbox in the background. Utilizes a current Riak Docker image built on amazonlinux... [abtreece/riak-kv](https://hub.docker.com/r/abtreece/riak-kv/)

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$ docker-compose up -d
Creating network "riak-repl-in-a-box_default" with the default driver
Creating riak-repl-in-a-box_coordinator-west_1 ... done
Creating riak-repl-in-a-box_coordinator-east_1 ... done
Creating riak-repl-in-a-box_member-west_1      ... done
Creating riak-repl-in-a-box_member-east_1      ... done

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Riak status

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

$ curl localhost:8098/stats | jq
{
  "connected_nodes": [
    "riak@172.20.0.5"
  ],
  ...
  "ring_members": [
    "riak@172.20.0.3",
    "riak@172.20.0.5"
  ],
  "ring_num_partitions": 64,
  "ring_ownership": "[{'riak@172.20.0.3',32},{'riak@172.20.0.5',32}]",

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Replication status

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

$ curl localhost:8098/riak-repl/stats | jq
{
  "realtime_enabled": "riak-west-1",
  "realtime_started": "riak-west-1",
  "fullsync_enabled": "riak-west-1",
  "fullsync_running": "",
  "cluster_name": "riak-east-1",
  "cluster_leader": "riak@172.20.0.5",
  "connected_clusters": [
    "riak-west-1"
  ],

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
