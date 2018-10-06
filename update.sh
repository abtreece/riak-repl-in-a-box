#!/bin/sh -eux

# The Amazon Linux Docker image doesn't contain all of the packages that the EC2
# instance starts with. This script installs the missing packages only when
# building a docker image

# List was generated by comparing the output of
#   docker run -it --rm amazonlinux:latest rpm --queryformat "%{NAME}\n" -qa | sort
# and
#   TODO: a kludged terraform found in provisioners/terraform/ec2rpms.tf
# Note that putting both outputs into a file and running `comm -23 file_a file_b` helps!

yum -y update

yum -y install \
  acpid \
  audit \
  audit-libs \
  authconfig \
  autogen-libopts \
  binutils \
  bzip2 \
  checkpolicy \
  cloud-disk-utils \
  cloud-init \
  cpio \
  cracklib \
  cracklib-dicts \
  cronie \
  cronie-anacron \
  crontabs \
  cyrus-sasl \
  dash \
  dbus-libs \
  dhclient \
  dhcp-common \
  diffutils \
  dracut \
  dracut-modules-growroot \
  e2fsprogs \
  e2fsprogs-libs \
  ec2-utils \
  ed \
  epel-release \
  ethtool \
  file \
  findutils \
  fipscheck \
  fipscheck-lib \
  gdisk \
  generic-logos \
  get_reference_source \
  gpg-pubkey \
  groff \
  groff-base \
  grub \
  grubby \
  hesiod \
  hmaccalc \
  hwdata \
  initscripts \
  iproute \
  iptables \
  iputils \
  jq \
  kbd \
  kbd-misc \
  kernel \
  kmod \
  kmod-libs \
  less \
  libblkid \
  libcap-ng \
  libcgroup \
  libedit \
  libidn \
  libmount \
  libnih \
  libpwquality \
  libselinux-utils \
  libsemanage \
  libss \
  libsysfs \
  libudev \
  libuser \
  libutempter \
  libuuid \
  libyaml \
  logrotate \
  mingetty \
  nc \
  net-tools \
  newt \
  newt-python27 \
  nss-pem \
  ntp \
  ntpdate \
  openssh \
  openssh-clients \
  openssh-server \
  pam \
  passwd \
  pciutils \
  pciutils-libs \
  policycoreutils \
  procmail \
  procps \
  psmisc \
  python27-babel \
  python27-backports \
  python27-backports-ssl_match_hostname \
  python27-configobj \
  python27-jinja2 \
  python27-jsonpatch \
  python27-jsonpointer \
  python27-markupsafe \
  python27-PyYAML \
  python27-requests \
  python27-setuptools \
  python27-six \
  python27-urllib3 \
  rootfiles \
  rsyslog \
  sendmail \
  setserial \
  shadow-utils \
  slang \
  sudo \
  sysfsutils \
  sysvinit \
  tcp_wrappers-libs \
  udev \
  update-motd \
  upstart \
  ustr \
  util-linux \
  vim-minimal \
  which \
  xz \
  yum-plugin-upgrade-helper


# Generate /etc/pam.d/*-ac files
/usr/sbin/authconfig --update

yum -y update

yum clean metadata
yum clean all
