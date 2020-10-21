# Monica

[Monica](https://www.monicahq.com/) is an open source personal CRM.

![amd64](https://img.shields.io/badge/{% if not monicahq.amd64 %}untested{% else %}{{ monicahq.amd64 }}{% endif %}-amd64-{% if not monicahq.amd64 %}inactive{% elif monicahq.amd64 == "verified" %}success{% elif monicahq.amd64 == "supported" %}informational{% elif monicahq.amd64 == "unsupported" %}critical{% endif %}?style=flat)
![arm64](https://img.shields.io/badge/{% if not monicahq.arm64 %}untested{% else %}{{ monicahq.arm64 }}{% endif %}-arm64-{% if not monicahq.arm64 %}inactive{% elif monicahq.arm64 == "verified" %}success{% elif monicahq.arm64 == "supported" %}informational{% elif monicahq.arm64 == "unsupported" %}critical{% endif %}?style=flat)
![armv7](https://img.shields.io/badge/{% if not monicahq.armv7 %}untested{% else %}{{ monicahq.armv7 }}{% endif %}-armv7-{% if not monicahq.armv7 %}inactive{% elif monicahq.armv7 == "verified" %}success{% elif monicahq.armv7 == "supported" %}informational{% elif monicahq.armv7 == "unsupported" %}critical{% endif %}?style=flat)

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! \
**Current Image Version:** {{ monicahq.version }}

## SETUP

### Enabling monicahq

#### Command:

**`vlab set monicahq.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
monicahq
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=monicahq`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

This requires some manual setup unfortunately.

First make sure all the migrations have completed and that accessing the Monica URL below renders a login page.

Once that is done, login to your server and stop the services with `systemctl stop vivumlab`

Spin up a monica specific app by CDing into the VivumLab Docker folder `cd {{ volumes_root }}/docker` and then running `docker-compose run monicahq shell`

Once you are inside the Docker container, run `php artisan setup:production` then after that's done `exit` the container. Now you should spin down the DB container left running with `docker stop docker_monicahq_db_1`.

NOW you should be able to access the Monica URL below again, and be presented with a registration page for the first account.

#### SMTP/ MAIL

1. run **`vlab decrypt`** to decrypt the `vault.yml` file

2. make some changes


##### SMTP Settings
```
smtp:
  host:
  port:
  user:
  pass:
  from_email:
  from_name:
```

3. run **`vlab update_one service=monicahq`** to complete the changes


## ACCESS

monicahq (HTTPS) link: [https://{% if monicahq.domain %}{{ monicahq.domain }}{% else %}{{ monicahq.subdomain + "." + domain }}{% endif %}/](https://{% if monicahq.domain %}{{ monicahq.domain }}{% else %}{{ monicahq.subdomain + "." + domain }}{% endif %}/)
monicahq (HTTP) link: [http://{% if monicahq.domain %}{{ monicahq.domain }}{% else %}{{ monicahq.subdomain + "." + domain }}{% endif %}/](http://{% if monicahq.domain %}{{ monicahq.domain }}{% else %}{{ monicahq.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ monicahq.subdomain + "." + tor_domain }}/](http://{{ monicahq.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set monicahq.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
monicahq
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=monicahq`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set monicahq.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
monicahq
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=monicahq`**

### DOMAIN
*Default: False*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set monicahq.domain monicahq.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
monicahq
  domain: monicahq.com
```

##### Finalising changes:

run: **`vlab update_one service=monicahq`**

### SUBDOMAIN
*Default: monicahq*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set monicahq.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
monicahq
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=monicahq`**

### VERSION
*Default: {{  monicahq.version  }}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set monicahq.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
monicahq
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=monicahq`**

## Need more help?
Further information regarding services can be found. \
General Information can be found in the [documentation](https://docs.vivumlab.com). \
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
