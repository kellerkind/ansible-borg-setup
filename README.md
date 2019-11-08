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

Prepare your backup jobs:

~/borgjobs.yml

```
backup_jobs:
    - source: /home/user/Documents
      archive: /media/data1/borgbackup
```

Setup borg and the backup jobs:

```
ansible-playbook -i ~/borg-inventory site.yml \
 --ask-vault-pass \
 -e@~/borgpassphrase.vault \
 -e@~/borgjobs.yml \
 -e@~/borgjobs.yml
```

A resulting job will look like that:

```
borg list /path/toarchive

20191108_rpi-9-media-data1-Documents Fri, 2019-11-08 11:29:06 [26e0c747a7dadef2eb97c26cc8bc88b8e9ac30e03d5b58c9e2c4ab1f5382a411]
```

The current date and the  `source` path (`/` replaced by `-`) is appended to the jobname.

Borgbackup is installed by default, using  its own in an virtualenv using the python package from pip.

DISCLAIMER: The passphrase is currently part of the resulting crontab entry on the remote host.
