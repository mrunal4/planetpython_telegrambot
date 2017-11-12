#!/bin/sh

### BEGIN INFO
# Provides:          allots ip
# Short-Description: allots ip in environment variable
# Description:       allots ip in environment variable via ip addr command
### END INFO

set -e

ipaddr=`hostname -I`