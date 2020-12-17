# MassiveDecks

[MassiveDecks](https://github.com/Lattyware/massivedecks/blob/master/README.md) Massive Decks is a comedy party game based on Cards against Humanity. Play with friends! It works great with a bunch of people in the same room on phones, or on voice chat online.

![amd64](https://img.shields.io/badge/{% if not massivedecks.amd64 %}untested{% else %}{{ massivedecks.amd64 }}{% endif %}-amd64-{% if not massivedecks.amd64 %}inactive{% elif massivedecks.amd64 == "verified" %}success{% elif massivedecks.amd64 == "supported" %}informational{% elif massivedecks.amd64 == "unsupported" %}critical{% endif %}?style=flat)
![arm64](https://img.shields.io/badge/{% if not massivedecks.arm64 %}untested{% else %}{{ massivedecks.arm64 }}{% endif %}-arm64-{% if not massivedecks.arm64 %}inactive{% elif massivedecks.arm64 == "verified" %}success{% elif massivedecks.arm64 == "supported" %}informational{% elif massivedecks.arm64 == "unsupported" %}critical{% endif %}?style=flat)
![armv7](https://img.shields.io/badge/{% if not massivedecks.armv7 %}untested{% else %}{{ massivedecks.armv7 }}{% endif %}-armv7-{% if not massivedecks.armv7 %}inactive{% elif massivedecks.armv7 == "verified" %}success{% elif massivedecks.armv7 == "supported" %}informational{% elif massivedecks.armv7 == "unsupported" %}critical{% endif %}?style=flat)

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!
**Current Image Version Client:** {{ massivedecks.client_version }}
**Current Image Version Server:** {{ massivedecks.server_version }}

## SETUP

### Enabling massivedecks

#### Command:

**`vlab set massivedecks.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
massivedecks
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=massivedecks`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ massivedecks.domain }}/admin*

Create an account with your desired username; as this is the first user, massivedecks makes this account the administrator.

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

3. run **`vlab update_one service=massivedecks`** to complete the changes


## ACCESS

massivedecks (HTTPS) link: [https://{% if massivedecks.domain %}{{ massivedecks.domain }}{% else %}{{ massivedecks.subdomain + "." + domain }}{% endif %}/](https://{% if massivedecks.domain %}{{ massivedecks.domain }}{% else %}{{ massivedecks.subdomain + "." + domain }}{% endif %}/)
massivedecks (HTTP) link: [http://{% if massivedecks.domain %}{{ massivedecks.domain }}{% else %}{{ massivedecks.subdomain + "." + domain }}{% endif %}/](http://{% if massivedecks.domain %}{{ massivedecks.domain }}{% else %}{{ massivedecks.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ massivedecks.subdomain + "." + tor_domain }}/](http://{{ massivedecks.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set massivedecks.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
massivedecks
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=massivedecks`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set massivedecks.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
massivedecks
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=massivedecks`**

### DOMAIN
*Default: False*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set massivedecks.domain massivedecks.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
massivedecks
  domain: massivedecks.com
```

##### Finalising changes:

run: **`vlab update_one service=massivedecks`**

### SUBDOMAIN
*Default: massivedecks*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set massivedecks.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
massivedecks
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=massivedecks`**

### VERSION
*Default: {{ massivedecks.client_version }}*
*Default: {{ massivedecks.server_version }}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set massivedecks.client_version 2.7`**
**`vlab set massivedecks.server_version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
massivedecks
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=massivedecks`**

## Need more help?
Further information regarding services can be found. \
General Information can be found in the [documentation](https://docs.vivumlab.com). \
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
