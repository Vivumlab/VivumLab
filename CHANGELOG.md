## [0.2.0](https://github.com/VivumLab/VivumLab/compare/v0.1.0...v0.2.0) (2020-10-18)


### Features

* **service:** :recycle: update netdata to keep config persistant ([#81](https://github.com/VivumLab/VivumLab/issues/81)) ([64ccda8](https://github.com/VivumLab/VivumLab/commit/64ccda86e6f729ddcf018b4f87497ad2282b12cf))
* **core:** SSH keys can be created within VivumLab ([#82](https://github.com/VivumLab/VivumLab/issues/82)) ([8df383c](https://github.com/VivumLab/VivumLab/commit/8df383c75dd0c6625ce712f6d039b0e29cd0cec3))


### Bug Fixes

* **service:** adds CentOS support for Netdata ([#87](https://github.com/VivumLab/VivumLab/issues/87)) ([9ad0198](https://github.com/VivumLab/VivumLab/commit/9ad019896668dbbbd6896e305e0e832e08e3a5c0))
* **setup:** fixes small issue with sshkeys/bash ([#79](https://github.com/VivumLab/VivumLab/issues/79)) ([63abc92](https://github.com/VivumLab/VivumLab/commit/63abc926269e95b55dd0b29f7960f6c0bade9255))

## [0.1.0](https://github.com/VivumLab/VivumLab/compare/v0.0.1...v0.1.0) (2020-10-07)


### Features

* **cleanup:** :wastebasket: cleanup unused website folder ([#78](https://github.com/VivumLab/VivumLab/issues/78)) ([b311fcb](https://github.com/VivumLab/VivumLab/commit/b311fcb28c6cb3beceeacbaaf364fe5397989312))
* **logo:** added picture logo ([#14](https://github.com/VivumLab/VivumLab/issues/14)) ([9db669d](https://github.com/VivumLab/VivumLab/commit/9db669d210b067afdfd95540fd28b57dc81a38b5))
* **service:** adding Readarr ([#4](https://github.com/VivumLab/VivumLab/issues/4)) ([90c5a8a](https://github.com/VivumLab/VivumLab/commit/90c5a8a5efef13f657e7b2d92edf381f9e276950))
* **core:** adds user tasks, that interact with the server ([#34](https://github.com/VivumLab/VivumLab/issues/34)) ([7ec548f](https://github.com/VivumLab/VivumLab/commit/7ec548f1eec3231350c0b7a5bbdf39c6bb4ff186))
* **core:** allow user to specify ssh keys ([#35](https://github.com/VivumLab/VivumLab/issues/35)) ([f39cd80](https://github.com/VivumLab/VivumLab/commit/f39cd80a29e573da8567bf5f3d2942f27e15fe49))
* **core:** Allows shell to use ansible variables ([#19](https://github.com/VivumLab/VivumLab/issues/19)) ([0995778](https://github.com/VivumLab/VivumLab/commit/09957785d0ea57ba688cbc314f744a819a1e510b))
* **core:** debug option for ansible playbook commands ([#15](https://github.com/VivumLab/VivumLab/issues/15)) ([1e2d21b](https://github.com/VivumLab/VivumLab/commit/1e2d21b776ed1efcd5bb6769998b87e2084df2b6))
* **core:** host docker daemon on ([#13](https://github.com/VivumLab/VivumLab/issues/13)) ([ac22945](https://github.com/VivumLab/VivumLab/commit/ac229459b9178b8ae016ef219378031e61a4f310))
* **core:** revised the setup prompts ([#17](https://github.com/VivumLab/VivumLab/issues/17)) ([5d7f450](https://github.com/VivumLab/VivumLab/commit/5d7f4508c7d339a289264f6bf81b59ced6937ca4))
* **core:** separate install of centos and debian based systems ([#18](https://github.com/VivumLab/VivumLab/issues/18)) ([b0a180b](https://github.com/VivumLab/VivumLab/commit/b0a180bffc3819c6836c4cb4e02c96db0b7cca91))
* **core:** task to create user edittable files/services ([#53](https://github.com/VivumLab/VivumLab/issues/53)) ([9b616bf](https://github.com/VivumLab/VivumLab/commit/9b616bfeb68cee1e50b4f626851f9f2e1b5c19b2))


### Bug Fixes

* **travis:** add python3 ([#27](https://github.com/VivumLab/VivumLab/issues/27)) ([e49eef9](https://github.com/VivumLab/VivumLab/commit/e49eef97db1eff4abc3d49a03bf6eadf05e6deea))
* **travis:** addding pre-commit stage to travis ([#24](https://github.com/VivumLab/VivumLab/issues/24)) ([a799b24](https://github.com/VivumLab/VivumLab/commit/a799b24f72a4f21d2b36801f0a01bda12b1e4b65))
* **travis:** adding commitlint ([#31](https://github.com/VivumLab/VivumLab/issues/31)) ([b71bc9d](https://github.com/VivumLab/VivumLab/commit/b71bc9d5f9434caa01ec0e90e0abd9c25931ae5c))
* **travis:** apt needs sudo ([#28](https://github.com/VivumLab/VivumLab/issues/28)) ([938ed5c](https://github.com/VivumLab/VivumLab/commit/938ed5c088dd7a8e782f1a9b0bf88e1cd2751870))
* **service:** authelia bug fix (new version) ([#8](https://github.com/VivumLab/VivumLab/issues/8)) ([5277acb](https://github.com/VivumLab/VivumLab/commit/5277acb5b70083578f996be123a2739097286875))
* **service:** authelia config bug ([#21](https://github.com/VivumLab/VivumLab/issues/21)) ([8fd68aa](https://github.com/VivumLab/VivumLab/commit/8fd68aa6dffbfe833c420c8dcb2c3bca5d5fbf45))
* **travis:** change language to python ([#30](https://github.com/VivumLab/VivumLab/issues/30)) ([0d90bbb](https://github.com/VivumLab/VivumLab/commit/0d90bbb4dbcc9afd83e937f2a6dd7d2a50c6fc94))
* **travis:** change pip to pip3 ([#26](https://github.com/VivumLab/VivumLab/issues/26)) ([e53af92](https://github.com/VivumLab/VivumLab/commit/e53af92dbe4c75ac638c7f4aea81bb1e91273b15))
* **travis:** commitlint fix ([#41](https://github.com/VivumLab/VivumLab/issues/41)) ([e1fae4e](https://github.com/VivumLab/VivumLab/commit/e1fae4e9c4aa96a55521e0e5f2265f936920e310))
* **service:** config.yml added watchtower.subdomain False ([#11](https://github.com/VivumLab/VivumLab/issues/11)) ([fc43902](https://github.com/VivumLab/VivumLab/commit/fc43902a8f17073d9958c249464c1be5a03ec324))
* db version no automatic main version change ([#75](https://github.com/VivumLab/VivumLab/issues/75)) ([556f5c9](https://github.com/VivumLab/VivumLab/commit/556f5c9c0e116a8acbe2d847f31836b9ea272521))
* **drone:** disable trim_blocks ([5f11964](https://github.com/VivumLab/VivumLab/commit/5f119642c4a60b18e881f228aacbc7dbbf4df22a))
* **travis:** fix automatic changelog ([#51](https://github.com/VivumLab/VivumLab/issues/51)) ([9c51e4b](https://github.com/VivumLab/VivumLab/commit/9c51e4beb0b936609199920e162efdd942975628))
* **cli:** fix cli run vlab update include more tasks ([4b8910a](https://github.com/VivumLab/VivumLab/commit/4b8910a77d05de27e6a24a2b59ad2a3721aae5f2))
* **ansible:** fix vlab update ([451b748](https://github.com/VivumLab/VivumLab/commit/451b7484ddf9feee61dbb1f53d01f17fca13e28e))
* **commitzen:** fixes commitzen cli dependencies ([#2](https://github.com/VivumLab/VivumLab/issues/2)) ([35bd93e](https://github.com/VivumLab/VivumLab/commit/35bd93e4a162e1188c0cafc5fd38c8b4c2cffd5f))
* **travis:** fixing commitlint ([#44](https://github.com/VivumLab/VivumLab/issues/44)) ([b55277a](https://github.com/VivumLab/VivumLab/commit/b55277a13a7ebaf8124047a1659dfcf5fb43dc2c))
* **service:** jinja2 trim_blocks ([#20](https://github.com/VivumLab/VivumLab/issues/20)) ([02ff58c](https://github.com/VivumLab/VivumLab/commit/02ff58c982ceb8c62e6f8a25267370e4f3400f16))
* **lint:** lint fixes ([#23](https://github.com/VivumLab/VivumLab/issues/23)) ([aa0b209](https://github.com/VivumLab/VivumLab/commit/aa0b2098589829c08e99237d8b2e8b25f464b585))
* **service:** netdata necessities and nice-to-haves fix needs become yes ([#55](https://github.com/VivumLab/VivumLab/issues/55)) ([97e8f4d](https://github.com/VivumLab/VivumLab/commit/97e8f4d9ba69ffc3bd48503377aa51456619e2fb))
* **service:** nextcloud (file permission set to user) ([#6](https://github.com/VivumLab/VivumLab/issues/6)) ([dcd0401](https://github.com/VivumLab/VivumLab/commit/dcd0401fb0e81848ab1059a2db9d78f6b6318fc9))
* nextcloud move webroot to storage_dir ([#7](https://github.com/VivumLab/VivumLab/issues/7)) ([26495b7](https://github.com/VivumLab/VivumLab/commit/26495b7310dd42744bb427b56bda2f9a4b5c4aa7))
* **ansible:** set unnecessary gather_facts for restart playbook to no ([b80eccb](https://github.com/VivumLab/VivumLab/commit/b80eccbb9a731567ebcd75793093bc5cd66b4d2b))
* small fix / disable cleanup ([#40](https://github.com/VivumLab/VivumLab/issues/40)) ([c1b65ae](https://github.com/VivumLab/VivumLab/commit/c1b65aed6ee9fa72c3ed1c9052aa7a70e7507fe1))
* **travis:** still trying to fix commitlint travis ([#43](https://github.com/VivumLab/VivumLab/issues/43)) ([7c32df6](https://github.com/VivumLab/VivumLab/commit/7c32df6dae0c5caed8a3a9b53f27773cb94c93e0))
* tmp files stacked via unused volumes ([#10](https://github.com/VivumLab/VivumLab/issues/10)) ([9a44870](https://github.com/VivumLab/VivumLab/commit/9a44870e1c0133c46657892a0f90777367f0ed50))
* **travis:** travis pre-commit change to run-all ([#25](https://github.com/VivumLab/VivumLab/issues/25)) ([41f2728](https://github.com/VivumLab/VivumLab/commit/41f2728278a3d1a7211422b5b305cb3435eb69cd))
* **service:** tv and movies not in video folder ([#5](https://github.com/VivumLab/VivumLab/issues/5)) ([5509748](https://github.com/VivumLab/VivumLab/commit/55097487b3771168cd15305309835405f4f5c15c))
* **travis:** typo ([#42](https://github.com/VivumLab/VivumLab/issues/42)) ([6de9f09](https://github.com/VivumLab/VivumLab/commit/6de9f0957b69f249cb454f97ef2660da3594b893))
* **ansible:** variable watchtower.domain is needed for ansible ([#9](https://github.com/VivumLab/VivumLab/issues/9)) ([82f710c](https://github.com/VivumLab/VivumLab/commit/82f710cc94442ee62db202474a3d28de2f8a9c73))
* **service:** zammad version bump and nginx scheme fix ([#12](https://github.com/VivumLab/VivumLab/issues/12)) ([9f1d2f7](https://github.com/VivumLab/VivumLab/commit/9f1d2f74dba736c3b700ef9a1daf0d46eab2f01a))

## Unreleased

### Refactor

- **service**: fix RSSHub env values (#59)
- **logo**: extra space, new colours (#60)
- **service**: remove unnecessary bookstack www-data permissions (#58)
- **service**: update jellyfin default version (#63)
- **logo**: added text logo to match (#62)
- **core**: fixes deploy, removes red wall of text (#61)
- **setup**: fixed debinstall.yml not found error (#57)
- **core**: fixed error in lifestyleTask file (#56)
- **core**: fixes commands using custom sshkeys (#54)
- **travis**: git credentials (#52)
- **travis**: branch set to master for release (#50)
- add automatic changelog (#49)
- move docs deployment to travis ci (#39)
- **docs**: documentation update (#36)
- **core**: refactor error system, fix service param, etc (#32)
- changing travis to only run when merged to master (#22)
- first commit

### Fix

- **service**: netdata necessities and nice-to-haves fix needs become yes (#55)
- **travis**: fix automatic changelog (#51)
- **travis**: fixing commitlint (#44)
- **travis**: still trying to fix commitlint travis (#43)
- **travis**: typo (#42)
- **travis**: commitlint fix (#41)
- small fix / disable cleanup (#40)
- **travis**: adding commitlint (#31)
- **travis**: change language to python (#30)
- **travis**: apt needs sudo (#28)
- **travis**: add python3 (#27)
- **travis**: change pip to pip3 (#26)
- **travis**: travis pre-commit change to run-all (#25)
- **travis**: addding pre-commit stage to travis (#24)
- **lint**: lint fixes (#23)
- **service**: authelia config bug (#21)
- **service**: jinja2 trim_blocks (#20)
- **service**: zammad version bump and nginx scheme fix (#12)
- **service**: config.yml added watchtower.subdomain False (#11)
- tmp files stacked via unused volumes (#10)
- **ansible**: variable watchtower.domain is needed for ansible (#9)
- **service**: authelia bug fix (new version) (#8)
- nextcloud move webroot to storage_dir (#7)
- **service**: nextcloud (file permission set to user) (#6)
- **service**: tv and movies not in video folder (#5)
- **commitzen**: fixes commitzen cli dependencies (#2)
- **cli**: fix cli run vlab update include more tasks
- **ansible**: fix vlab update
- **ansible**: set unnecessary gather_facts for restart playbook to no
- **drone**: disable trim_blocks

### Feat

- **core**: task to create user edittable files/services (#53)
- **core**: allow user to specify ssh keys (#35)
- **core**: adds user tasks, that interact with the server (#34)
- **core**: Allows shell to use ansible variables (#19)
- **core**: separate install of centos and debian based systems (#18)
- **core**: revised the setup prompts (#17)
- **core**: debug option for ansible playbook commands (#15)
- **logo**: added picture logo (#14)
- **core**: host docker daemon on (#13)
- **service**: adding Readarr (#4)
