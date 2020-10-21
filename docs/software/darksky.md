# Darksky

[darksky-influxdb](https://github.com/ErwinSteffens/darksky-influxdb) pulls in weather data for your location every 2 minutes from [Darksky](http://darksky.net/) and saves it to your [InfluxDB](software/influxdb) instance.

![amd64](https://img.shields.io/badge/{% if not dark_sky.amd64 %}untested{% else %}{{ dark_sky.amd64 }}{% endif %}-amd64-{% if not dark_sky.amd64 %}inactive{% elif dark_sky.amd64 == "verified" %}success{% elif dark_sky.amd64 == "supported" %}informational{% elif dark_sky.amd64 == "unsupported" %}critical{% endif %}?style=flat)
![arm64](https://img.shields.io/badge/{% if not dark_sky.arm64 %}untested{% else %}{{ dark_sky.arm64 }}{% endif %}-arm64-{% if not dark_sky.arm64 %}inactive{% elif dark_sky.arm64 == "verified" %}success{% elif dark_sky.arm64 == "supported" %}informational{% elif dark_sky.arm64 == "unsupported" %}critical{% endif %}?style=flat)
![armv7](https://img.shields.io/badge/{% if not dark_sky.armv7 %}untested{% else %}{{ dark_sky.armv7 }}{% endif %}-armv7-{% if not dark_sky.armv7 %}inactive{% elif dark_sky.armv7 == "verified" %}success{% elif dark_sky.armv7 == "supported" %}informational{% elif dark_sky.armv7 == "unsupported" %}critical{% endif %}?style=flat)

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! \
**Current Image Version:** {{ dark_sky.version }}

## SETUP

### Enabling dark_sky

#### Command:

**`vlab set dark_sky.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
dark_sky
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=dark_sky`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

## Access

There is no direct access to it, but you can create graphs via [Grafana](software/grafana) to visualize it.

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set dark_sky.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
dark_sky
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=dark_sky`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set dark_sky.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
dark_sky
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=dark_sky`**

### DOMAIN
*Default: False*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set dark_sky.domain dark_sky.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
dark_sky
  domain: dark_sky.com
```

##### Finalising changes:

run: **`vlab update_one service=dark_sky`**

### SUBDOMAIN
*Default: dark_sky*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set dark_sky.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
dark_sky
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=dark_sky`**

### VERSION
*Default: {{  dark_sky.version  }}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set dark_sky.version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
dark_sky
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=dark_sky`**

## Need more help?
Further information regarding services can be found. \
General Information can be found in the [documentation](https://docs.vivumlab.com). \
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
