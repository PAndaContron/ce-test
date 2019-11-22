#!/bin/bash

sed -e "s,ROM,$CEDEV/CEmu/ti-84ce.rom,g" -e "s,NAME,$1,g" <run-template.json >run.json