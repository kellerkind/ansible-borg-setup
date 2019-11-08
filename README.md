# Ansible Borg Backup Setup

## Setup

Create an inventory file containing your borg hosts

inventory:
```
[borg]
...
```

Create a vault file containing your `borg_passphrase`

ansible-vault edit ~/borgpassphrase.vault

Setup borg and the backup jobs:

```
ansible-playbook -i inventory site.yml --ask-vault-pass -e@~/borgpassphrase.vault
```

Borgbackup is installed by default, using  its own in an virtualenv using the python package from pip.

DISCLAIMER: The passphrase is currently part of the crontab entry.
