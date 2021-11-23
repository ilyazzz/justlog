#!/bin/sh

# 1000 is the default UID and GID if variables are not set

chown -R ${UID:=1000}:${GID:=1000} /logs /etc/justlog.json

exec su justlog -c "/app --config=/etc/justlog.json"