# WebTrees

[WebTrees](https://www.webtrees.net) Online Genealogy

![amd64](https://img.shields.io/badge/{% if not webtrees.amd64 %}untested{% else %}{{ webtrees.amd64 }}{% endif %}-amd64-{% if not webtrees.amd64 %}inactive{% elif webtrees.amd64 == "verified" %}success{% elif webtrees.amd64 == "supported" %}informational{% elif webtrees.amd64 == "unsupported" %}critical{% endif %}?style=flat)
![arm64](https://img.shields.io/badge/{% if not webtrees.arm64 %}untested{% else %}{{ webtrees.arm64 }}{% endif %}-arm64-{% if not webtrees.arm64 %}inactive{% elif webtrees.arm64 == "verified" %}success{% elif webtrees.arm64 == "supported" %}informational{% elif webtrees.arm64 == "unsupported" %}critical{% endif %}?style=flat)
![armv7](https://img.shields.io/badge/{% if not webtrees.armv7 %}untested{% else %}{{ webtrees.armv7 }}{% endif %}-armv7-{% if not webtrees.armv7 %}inactive{% elif webtrees.armv7 == "verified" %}success{% elif webtrees.armv7 == "supported" %}informational{% elif webtrees.armv7 == "unsupported" %}critical{% endif %}?style=flat)

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!  
**Current Image Version:** {{ webtrees.version }}

## SETUP

### Enabling webtrees

#### Command:

**`vlab set webtrees.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
webtrees
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=webtrees`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ webtrees.domain }}/admin*

Create an account with your desired username; as this is the first user, webtrees makes this account the administrator.

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

3. run **`vlab update_one service=webtrees`** to complete the changes


## ACCESS

webtrees (HTTPS) link: [https://{% if webtrees.domain %}{{ webtrees.domain }}{% else %}{{ webtrees.subdomain + "." + domain }}{% endif %}/](https://{% if webtrees.domain %}{{ webtrees.domain }}{% else %}{{ webtrees.subdomain + "." + domain }}{% endif %}/)
webtrees (HTTP) link: [http://{% if webtrees.domain %}{{ webtrees.domain }}{% else %}{{ webtrees.subdomain + "." + domain }}{% endif %}/](http://{% if webtrees.domain %}{{ webtrees.domain }}{% else %}{{ webtrees.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ webtrees.subdomain + "." + tor_domain }}/](http://{{ webtrees.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set webtrees.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
webtrees
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=webtrees`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set webtrees.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
webtrees
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=webtrees`**

### DOMAIN
*Default: False*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set webtrees.domain webtrees.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
webtrees
  domain: webtrees.com
```

##### Finalising changes:

run: **`vlab update_one service=webtrees`**

### SUBDOMAIN
*Default: webtrees*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set webtrees.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
webtrees
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=webtrees`**

### VERSION
*Default: {{  webtrees.version  }}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set webtrees.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
webtrees
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=webtrees`**

## Need more help?
Further information regarding services can be found. \
General Information can be found in the [documentation](https://docs.vivumlab.com). \
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
