#!/bin/sh -eux

yum -y update

yum -y install \
  iputils \
  jq \
  ping \
  shadow-utils \
  sudo \
  tar \
  util-linux

yum clean metadata
yum clean all
