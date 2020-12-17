# Installation

Firstly, thanks for trying VivumLab. We are glad you are here.

VivumLab is designed to be run from a client computer. It will setup, and configure your remote server, with minimal intervention on your behalf.

There have been reports that VivumLab works when transferred to the remote server, and run from there; however, VivumLab is not designed for this, and as such, this is not supported; running VivumLab in this way may have undesirable results; and does not provide any foreseeable benefits.

!!! Warning "Beta Software Warning"

    This software has not reached version 1.0 and should therefore be considered unstable/beta. If you like getting your hands dirty in early versions of software, this is for you; stability is not guaranteed.

    Using this software may render your data unusable; using this software is at your own discretion.

    To ensure the safety of your data, consider:
    - making regular backups
    - testing software without your own data

## Requirements

### Server

- A suitable OS:
    - Ubuntu Server 16 and above
    - Debian 9 and above
    - CentOS 6 and above
    - Raspbery Pi OS 2017-08-16 and above (in theory)
- `sudo` must be available
- [Passwordless SSH via SSH keys](https://linuxconfig.org/passwordless-ssh) working

!!! Warning
    If you are running on an ARM infrastructure such as Raspberry PI, ensure `arm`  is set to 'true' in the config.yml file, on the client computer.

### Client Computer

- Docker (installed and working)

!!! Note:
    The idea is that you deploy from your personal computer to the server. This way your settings are saved on your personal computer, which can be used to re-build the server and restore from backups if anything goes wrong.

### Domain Name

Configure your domains' `A` type DNS record to point at your server's IP address. This is applicable for subdomains as well, eg. `*.test.yourdomain.com` would work.

!!! Note:
    Configuring your domain is (in a sense) optional as:
    - you can use Tor to access your services without registering a domain
    - you can *fake* it by adding DNS overrides to your `/etc/hosts` file on *nix and MacOS if needed

!!! Note: Domains are preferred
    An actual domain is highly recommended, as:
    - service clients may not work through TOR
    - certain services may not work through TOR
    - private DNS services eventually cost more than getting your own domain
    - public DNS services are unreliable
    - public domains tend to be high maintenance

#### DNS Settings

You need to point your `domain` and your `*.domain` (wildcard) to the IP address that your VivumLab deployment is accessible at. HOWEVER, If you are using:
- a [bastion](Bastion.md) host; point at the bastion hosts' IP
- your home server; use your home [IP address](https://duckduckgo.com/?q=whats+my+ip)

!!! Note: You need to set up a wildcard DNS entry (*.domain) because all the services are served off of subdomains. i.e. The Plex service defaults to `plex.yourdomain`, and the Hubzilla service defaults to `hubzilla.yourdomain`, etc

!!! Warning
    If you are not using a real domain, but using `/etc/hosts` entries to 'fake' it, wildcard entries will not work in `/etc/hosts`. Instead you will need to create an entry for each service enabled. The `vivumlab_hosts` file (located in the remote/deploy servers' VivumLab root folder), is available to you for this purpose.

#### Changing your domain

It is possible to change your domain:

Using the command line, run:

**`vlab set domain=<your.new.domain>`e`**

then run **`vlab deploy`** to finalise the changes

alternatively, you can set the appropriate service settings in `settings/config.yml` to True, and then run **``vlab deploy``**

eg.
```
domain: <your.domain>
```

### Port Forwarding

Ports '80' and '443' will need to be forwarded for VivumLab to work.. This is typically only necessary with infrastructure that you have direct networking control of; the most common scenario here, would be a home server.

!!! Note
    you do not need to deal with port forwarding or firewalls, if you are using a [bastion](Bastion.md) server or [TOR](Tor.md)access

### Cloud Bastion Server

Rather than pointing the domain at your home IP and having to manage DDNS, you can utilize a cloud server
to act as a bastion host via Tinc vpn and nginx.

Fore more information, look [here](Bastion.md)

### S3 Account

S3 is Amazon's Simple Storage Service which VivumLab can optionally use to back up to. You can use Amazon's service, or one of many other S3 compatible providers. You can also back up to another VivumLab instance if that other instance is running Minio, a self-hosted S3 service.

### Manual Set-up

* Download the [master](https://github.com/Vivumlab/VivumLab/archive/master.zip) version to your client computer and extract the folder. From inside the folder run **`./vlab install_cli`** now you can run any **`vlab`** command directly. Otherwise just append **`./`** to all further **`vlab`** commands.

!!! Note
    If you are using VivumLab to provision a [bastion](Bastion.md) server, run: **`vlab terraform`**

* From inside the VivumLab folder, set up the initial config: **`vlab config`**

!!! Note
    You will be prompted for the basic information to get started. The passwords entered here will be stored on the client computer and are used by ansible to configure your server. After you enter the information, VivumLab will configure your local docker images and build your initial `settings/` files.

* Once you have updated your settings simply deploy VivumLab with **`vlab deploy`**. You can run **`vlab deploy`** as many times as needed to get your settings correct.

You can check http://{{ vlab_ip }}:8181 in a browser to see the Traefik dashboard.

See a full list of commands on the [Commands](Commands.md) page

## Enabling Services

Run **`vlab set SERVICENAME.enable=true`** where SERVICENAME is the name of the service you want to enable.
- eg **`vlab set jellyfin.enable=true`**

Then run **`vlab deploy`** again. That's it. It will take a few minutes for your server to deploy and start the relevant services.


!!! warning
    Some services expose 'setup' pages upon deployment. If you don't complete the set up step, there is a chance someone else could beat you to it. If they do just run **`vlab reset_one SERVICENAME`** then **`vlab deploy`** again and the service will reset to it's freshly installed state.

You can SSH into the server, and run **`systemctl status SERVICENAME`** where SERVICENAME is the name of the service you want to check is running. It will show you status and/or errors of the service.

!!! example
    **`systemctl status miniflux`**

## Syncing Settings via Git

VivumLab will automatically keep the `settings/` folder in sync with a git repo if it has one.
So you can create a private repo on your Gitea instance for example, then clone that repo over the settings folder. Now any changes you make to `settings/` files will be commited and pushed to that git repo whenever you run **`vlab deploy`**, **`vlab update`** or **`vlab config`**.

## Backing up your Vault Password

!!! danger
    This bit is important.

Your vault password exists at `~/.vlab_vault_pass` for the user you ran the script as (possibly the user you are logged in as, right now).
Make sure to back this password up somewhere safe, and ideally _not_ in your `settings/` folder. If someone gains access to your `settings/` folder and the vault password, bad things can happen. Store them separately.
