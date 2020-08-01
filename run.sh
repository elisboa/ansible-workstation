#!/bin/sh

set -ex

ansible-playbook --connection local --inventory inventory.ini "$@"
