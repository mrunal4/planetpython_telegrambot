#!/bin/bash

set -e


supervisord

service nginx start 