# Ansible Borg Backup Setup

## Setup

Create an inventory file containing your borg hosts

~/borg-inventory:

```
[borg]
localhost
rpi ansible_ssh_user=pi
...
```

Create a vault file containing your `borg_passphrase`

```
ansible-vault edit ~/borgpassphrase.vault
```

Setup borg and the backup jobs:

```
ansible-playbook -i ~/borg-inventory site.yml --ask-vault-pass -e@~/borgpassphrase.vault
```

Borgbackup is installed by default, using  its own in an virtualenv using the python package from pip.

DISCLAIMER: The passphrase is currently part of the resulting crontab entry on the remote host.
