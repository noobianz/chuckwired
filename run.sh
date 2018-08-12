#!/bin/bash
export ANSIBLE_HOST_KEY_CHECKING=false
ansible-playbook -i ./hosts -l local playbook.yml
ansible-playbook -i ./hosts -l chuckwired install.yml
ansible-playbook -i ./hosts -l chuckwired monitor.yml
