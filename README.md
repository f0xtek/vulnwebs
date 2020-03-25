# Vulnwebs

Ansible playbook to run common vulnerable web apps for ethical hacking practice.

The playbook will install the following intentionally vulnerable web applications:

* OWASP Juice Shop
* OWASP WebGoat
* Damn Vulnerable Web Application (DVWA)

## Prerequisites

1. [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) (>= 2.9) installed on host machine
2. VM running either [Ubuntu Desktop](https://ubuntu.com/download/desktop) or [Ubuntu Server](https://ubuntu.com/download/server) (Minimum 1 vCPU, 2GB RAM)
3. A standard user account in the VM with sudo privileges
4. SSH access from host machine to the VM user specified in step 2 via SSK keys (e.g. `ssh-copy-id user@VM`)

## Setup

Once all the prerequisites are met, run the `prep.sh` script as follows:

`bash ./prep.sh <VM IP Address> <VM username>`

This will configure the ansible inventory file in this directory with the correct IP address and username for your VM.

Execute the ansible playbook with the following command:

`ansible-playbook -i ./inventory playbook.yml`

>Note: if you do not have passwordless sudo access for your VM user, add the `-K` flag to your `ansible-playbook` command to be prompted for your sudo password:
`ansible-playbook -i ./inventory -K playbook.yml`

Once the ansible play has successfully completed, all applications will be running and are accessible on the VMs IP address via the following ports:

|Application|Port|
|---|---|
|Juice Shop|http://ip:3000|
|WebGoat|http://ip:3001/WebGoat|
|DVWA|http://ip:3002|

> Note: replace 'ip' in the above URLs with the IP address of your VM

Providing your attacker machine (e.g. Kali) is on the same network, you will be able to enumerate the VM and attack the applications.

Happy hacking!
