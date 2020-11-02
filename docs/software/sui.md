# SUI

[SUI](https://gitlab.com/WillFantom/sui) a startpage for your server and / or new tab page

![amd64](https://img.shields.io/badge/{% if not sui.amd64 %}untested{% else %}{{ sui.amd64 }}{% endif %}-amd64-{% if not sui.amd64 %}inactive{% elif sui.amd64 == "verified" %}success{% elif sui.amd64 == "supported" %}informational{% elif sui.amd64 == "unsupported" %}critical{% endif %}?style=flat)
![arm64](https://img.shields.io/badge/{% if not sui.arm64 %}untested{% else %}{{ sui.arm64 }}{% endif %}-arm64-{% if not sui.arm64 %}inactive{% elif sui.arm64 == "verified" %}success{% elif sui.arm64 == "supported" %}informational{% elif sui.arm64 == "unsupported" %}critical{% endif %}?style=flat)
![armv7](https://img.shields.io/badge/{% if not sui.armv7 %}untested{% else %}{{ sui.armv7 }}{% endif %}-armv7-{% if not sui.armv7 %}inactive{% elif sui.armv7 == "verified" %}success{% elif sui.armv7 == "supported" %}informational{% elif sui.armv7 == "unsupported" %}critical{% endif %}?style=flat)

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!\
**Current Image Version:** {{ sui.version }}

## SETUP

### Enabling sui

#### Command:

**`vlab set sui.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
sui
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=sui`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ sui.domain }}/admin*

Create an account with your desired username; as this is the first user, sui makes this account the administrator.

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

3. run **`vlab update_one service=sui`** to complete the changes


## ACCESS

sui (HTTPS) link: [https://{% if sui.domain %}{{ sui.domain }}{% else %}{{ sui.subdomain + "." + domain }}{% endif %}/](https://{% if sui.domain %}{{ sui.domain }}{% else %}{{ sui.subdomain + "." + domain }}{% endif %}/)
sui (HTTP) link: [http://{% if sui.domain %}{{ sui.domain }}{% else %}{{ sui.subdomain + "." + domain }}{% endif %}/](http://{% if sui.domain %}{{ sui.domain }}{% else %}{{ sui.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ sui.subdomain + "." + tor_domain }}/](http://{{ sui.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set sui.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
sui
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=sui`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set sui.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
sui
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=sui`**

### DOMAIN
*Default: False*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set sui.domain sui.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
sui
  domain: sui.com
```

##### Finalising changes:

run: **`vlab update_one service=sui`**

### SUBDOMAIN
*Default: sui*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set sui.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
sui
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=sui`**

### VERSION
*Default: {{  sui.version  }}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set sui.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
sui
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=sui`**

## Need more help?
Further information regarding services can be found. \
General Information can be found in the [documentation](https://docs.vivumlab.com). \
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
