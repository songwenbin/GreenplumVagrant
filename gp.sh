#!/usr/bin/env bash
/usr/bin/expect<<EOF
spawn  /bin/bash /vagrant/$1
expect  "I HAVE READ AND AGREE TO THE TERMS OF THE ABOVE EMC SOFTWARE LICENSE AGREEMENT" 
send "\s"
send "\s"
send "\s"
send "\s"
send "\s"
send "\s"
send "\s"
send "\s"
send "\s"
send "\s"
send "\s"
send "\s"
send "\s"
send "\s"
send "\s"
send "\s"
send "\s"
send "\s"
send "\s"
send "\s"
send "\s"
send "\s"
send "\s"
send "\s"
send "\s"
send "\s"
send "\s"
send "\s"
send "\s"
send "\s"
send "\s"
send "\s"
send "\s"
send "\s"
send "\s"
send "\s"
send "\s"
send "\s"
send "\s"
send "\s"
expect {
 "Do you accept the Pivotal Database license agreement?"
{
send "yes\r"
exp_continue}
}
expect {
"Provide the installation path for Greenplum Database or press" 
{ send "/opt/greenplum \r"
exp_continue }
}
expect {
 "Install Greenplum Database into" 
{send "yes\r"
exp_continue }
}
#send "\r"
#expect
EOF
