# Factorio

[Factorio](https://github.com/factoriotools/factorio-docker) Factorio headless server in a Docker container

![amd64](https://img.shields.io/badge/{% if not factorio.amd64 %}untested{% else %}{{ factorio.amd64 }}{% endif %}-amd64-{% if not factorio.amd64 %}inactive{% elif factorio.amd64 == "verified" %}success{% elif factorio.amd64 == "supported" %}informational{% elif factorio.amd64 == "unsupported" %}critical{% endif %}?style=flat)
![arm64](https://img.shields.io/badge/{% if not factorio.arm64 %}untested{% else %}{{ factorio.arm64 }}{% endif %}-arm64-{% if not factorio.arm64 %}inactive{% elif factorio.arm64 == "verified" %}success{% elif factorio.arm64 == "supported" %}informational{% elif factorio.arm64 == "unsupported" %}critical{% endif %}?style=flat)
![armv7](https://img.shields.io/badge/{% if not factorio.armv7 %}untested{% else %}{{ factorio.armv7 }}{% endif %}-armv7-{% if not factorio.armv7 %}inactive{% elif factorio.armv7 == "verified" %}success{% elif factorio.armv7 == "supported" %}informational{% elif factorio.armv7 == "unsupported" %}critical{% endif %}?style=flat)

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!!\
**Current Image Version:** {{ factorio.version }}

## SETUP

### Enabling factorio

#### Command:

**`vlab set factorio.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
factorio
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=factorio`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ factorio.domain }}/admin*

Create an account with your desired username; as this is the first user, factorio makes this account the administrator.

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

3. run **`vlab update_one service=factorio`** to complete the changes


## Access

It is available at {{ domain }}. No subdomain needed since it works on exposed ports 34197 and 27015. A direct IP connection will also work.

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set factorio.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
factorio
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=factorio`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set factorio.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
factorio
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=factorio`**

### DOMAIN
*Default: False*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set factorio.domain factorio.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
factorio
  domain: factorio.com
```

##### Finalising changes:

run: **`vlab update_one service=factorio`**

### SUBDOMAIN
*Default: factorio*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set factorio.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
factorio
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=factorio`**

### VERSION
*Default: {{  factorio.version  }}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set factorio.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
factorio
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=factorio`**

## Need more help?
Further information regarding services can be found. \
General Information can be found in the [documentation](https://docs.vivumlab.com). \
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
