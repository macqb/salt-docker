#!/bin/bash

#
# Salt-Master Run Script
#

set -e

# Log Level
LOG_LEVEL=${LOG_LEVEL:-"info"}

# Run Salt as a Daemon
/usr/bin/salt-master --log-level=$LOG_LEVEL
