# TICK

Enabling the TICK stack enables Telegraf, [InfluxDB](https://www.influxdata.com/time-series-platform/influxdb/), Chronograf, and Kapacitor.

[InfluxDB](https://www.influxdata.com/time-series-platform/influxdb/) is the Time Series Database that [Darksky](software/darksky) writes to and [Grafana](software/grafana) can visualize.

It can also take data from [Home Assistant](software/homeassistant) and many other sources.

![amd64](https://img.shields.io/badge/{% if not tick.amd64 %}untested{% else %}{{ tick.amd64 }}{% endif %}-amd64-{% if not tick.amd64 %}inactive{% elif tick.amd64 == "verified" %}success{% elif tick.amd64 == "supported" %}informational{% elif tick.amd64 == "unsupported" %}critical{% endif %}?style=flat)
![arm64](https://img.shields.io/badge/{% if not tick.arm64 %}untested{% else %}{{ tick.arm64 }}{% endif %}-arm64-{% if not tick.arm64 %}inactive{% elif tick.arm64 == "verified" %}success{% elif tick.arm64 == "supported" %}informational{% elif tick.arm64 == "unsupported" %}critical{% endif %}?style=flat)
![armv7](https://img.shields.io/badge/{% if not tick.armv7 %}untested{% else %}{{ tick.armv7 }}{% endif %}-armv7-{% if not tick.armv7 %}inactive{% elif tick.armv7 == "verified" %}success{% elif tick.armv7 == "supported" %}informational{% elif tick.armv7 == "unsupported" %}critical{% endif %}?style=flat)

## Information


**Docker Image:** !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! \
**Current Image Version Telegraf:** {{ tick.telegraf_version }} \
**Current Image Version Influxdb:** {{ tick.influxdb_version }} \
**Current Image Version Chronograf:** {{ tick.chronograf_version }} \
**Current Image Version Kapacitor:** {{ tick.kapacitor_version }}


## SETUP

### Enabling tick

#### Command:

**`vlab set tick.enable True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
tick
  enable: True
```

#### Finalising changes:

run: **`vlab update_one service=tick`**

## FIRST RUN

!!! **DEVELOPERS**: make sure that you include any information that the user requires to get started, below. !!!

!!! Below are some **examples** with headings, and with some **example** instructions !!!

#### ADMINISTRATOR SETUP

Navigate to *https://{{ tick.domain }}/admin*

Create an account with your desired username; as this is the first user, tick makes this account the administrator.

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

3. run **`vlab update_one service=tick`** to complete the changes


## ACCESS

tick (HTTPS) link: [https://{% if tick.domain %}{{ tick.domain }}{% else %}{{ tick.subdomain + "." + domain }}{% endif %}/](https://{% if tick.domain %}{{ tick.domain }}{% else %}{{ tick.subdomain + "." + domain }}{% endif %}/)
tick (HTTP) link: [http://{% if tick.domain %}{{ tick.domain }}{% else %}{{ tick.subdomain + "." + domain }}{% endif %}/](http://{% if tick.domain %}{{ tick.domain }}{% else %}{{ tick.subdomain + "." + domain }}{% endif %}/)

{% if enable_tor %}
Tor link: [http://{{ tick.subdomain + "." + tor_domain }}/](http://{{ tick.subdomain + "." + tor_domain }}/)
{% endif %}

## OPTIONS

### HTTPS_ONLY
*Default: False*
*Options: True/False*

#### Command:

**`vlab set tick.https_only True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
tick
  https_only: True
```

##### Finalising changes:

run: **`vlab update_one service=tick`**

### AUTH
*Default: False*
*Options: True/False*

#### Command:

**`vlab set tick.auth True`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
tick
  auth: True
```

##### Finalising changes:

run: **`vlab update_one service=tick`**

### DOMAIN
*Default: False*
*NOTE: include the sitename and top level domain suffix. eg. name.com, site.net*

#### Command:

**`vlab set tick.domain tick.com`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
tick
  domain: tick.com
```

##### Finalising changes:

run: **`vlab update_one service=tick`**

### SUBDOMAIN
*Default: tick*
*NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.{{domain}}'*

#### Command:

**`vlab set tick.subdomain media`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
tick
  subdomain: media
```

##### Finalising changes:

run: **`vlab update_one service=tick`**

### VERSION
*Default: {{  tick.telegraf_version  }}*
*NOTE: Ensure that the version exists*

#### Command:

**`vlab set tick.telegraf_version 2.7`**

#### File alteration:

set the appropriate service settings in `settings/config.yml` to true

eg.
```
tick
  version: 2.7
```

##### Finalising changes:

run: **`vlab update_one service=tick`**

## Need more help?
Further information regarding services can be found. \
General Information can be found in the [documentation](https://docs.vivumlab.com). \
Additional assistance can be found on our [Contact Us](https://docs.vivumlab.com/Contact-us) page.
