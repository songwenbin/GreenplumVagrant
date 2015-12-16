#!/usr/bin/env bash

/usr/bin/expect<<EOF
spawn gpssh-exkeys -f /home/gpadmin/conf/hostlist
expect "*** Enter password for sdw1:"
send "gpadmin\r"
expect
EOF

/usr/bin/expect<<EOF
spawn gpinitsystem -c /home/gpadmin/gpinitsystem_config
expect "/home/gpadmin/gpinitsystem_config"
send "yes\r"
expect "Continue with Greenplum creation Yy/Nn>"
send "y\r"
set timeout 180
expect
EOF
