#!/bin/bash

grep "job09" /etc/group | cut -d: -f4 | tr ',' '\n' | xargs -I {} sudo userdel -rf {}

