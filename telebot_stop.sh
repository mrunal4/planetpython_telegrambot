#!/bin/bash

set -e


supervisordkill -INT $(pidof /usr/bin/python /usr/bin/supervisord)

service nginx stop