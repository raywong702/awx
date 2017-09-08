#!/usr/bin/env bash

function install_ansible_ubuntu() {
  sudo apt-get update
  sudo apt-get install software-properties-common
  sudo apt-add-repository ppa:ansible/ansible -y
  sudo apt-get update
  sudo apt-get install ansible -y
}

function install_awx_dependencies(){
  for role in geerlingguy.repo-epel geerlingguy.git geerlingguy.ansible geerlingguy.docker geerlingguy.pip geerlingguy.nodejs geerlingguy.awx
  do
    sudo ansible-galaxy install ${role} -f
  done
}

install_ansible_ubuntu
install_awx_dependencies
`dirname $0`/awx.yml

exit 0
