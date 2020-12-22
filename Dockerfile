FROM ruby:latest

ENV ANSIBLE_VERSION 2.9.11
ENV MITOGEN_VERSION 0.2.9
ENV ANSIBLE_GATHERING smart
ENV ANSIBLE_HOST_KEY_CHECKING false
ENV ANSIBLE_RETRY_FILES_ENABLED false
ENV ANSIBLE_ROLES_PATH /ansible/playbooks/roles
ENV ANSIBLE_SSH_PIPELINING True
ENV ANSIBLE_VAULT_PASSWORD_FILE /ansible_vault_pass
ENV ANSIBLE_CONFIG=/data/ansible.cfg
ENV PYTHONPATH /ansible/lib
ENV PATH /ansible/bin:$PATH
ENV ANSIBLE_LIBRARY /ansible/library
ENV ANSIBLE_STRATEGY_PLUGINS=/usr/local/lib/python3.8/site-packages/ansible_mitogen/plugins/strategy
ENV ANSIBLE_STRATEGY=mitogen_linear

ENV BUILD_PACKAGES \
    jq \
    python3-dev \
    python3-pip \
    python3-dateutil \
    python3-httplib2 \
    python3-jinja2 \
    python3-paramiko \ 
    python3-setuptools

ENV PYTHON_PACKAGES \
    python3-keyczar \
    boto3 \
    docker-py \
    pyOpenSSL \
    pre-commit

COPY Gemfile /Gemfile

RUN set -x && \
    \
    echo "==> Adding build dependencies..." && \
    apt-get update && \
    apt-get install --no-install-recommends -y ${BUILD_PACKAGES} && \
    pip3 install --upgrade pip && \
    pip3 install ${PYTHON_PACKAGES} && \
    \
    echo "==> Installing Ansible... " && \
    pip3 install ansible==${ANSIBLE_VERSION} && \
    pip3 install mitogen==${MITOGEN_VERSION} && \
    \
    echo "==> Cleaning up..." && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* && \
    \
    echo "==> Adding Hosts to Anisible directory for convenience..." && \
    mkdir -p /etc/ansible /ansible && \
    echo "[local]" >> /etc/ansible/hosts && \
    echo "localhost" >> /etc/ansible/hosts && \
    \
    echo "==> Installing Terraform..." && \
    wget https://releases.hashicorp.com/terraform/$(curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest | grep tag_name | awk {' print $2 '} | sed 's/"//g' | sed 's/,//' | sed 's/v//')/terraform_$(curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest | grep tag_name | awk {' print $2 '} | sed 's/"//g' | sed 's/,//' | sed 's/v//')_linux_amd64.zip && \
    unzip terraform_$(curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest | grep tag_name | awk {' print $2 '} | sed 's/"//g' | sed 's/,//' | sed 's/v//')_linux_amd64.zip && \
    mv terraform /usr/local/bin && \
    bundle install && \
    ln -s /data/vlab /usr/local/bin/vlab


WORKDIR /data
