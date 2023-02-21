FROM python:3.9-slim

LABEL "maintainer"="Ansible by Red Hat <info@ansible.com>"
LABEL "repository"="https://github.com/Squid-Checker/ansible-lint-action"
LABEL "homepage"="https://github.com/Squid-Checker/ansible-lint-action"

LABEL "com.github.actions.name"="ansible-lint"
LABEL "com.github.actions.description"="Run Ansible Lint"
LABEL "com.github.actions.icon"="activity"
LABEL "com.github.actions.color"="gray-dark"

# Install git (required by ansible-lint)
RUN set -ex && apt-get update && apt-get -q install -y -V git && rm -rf /var/lib/apt/lists/*

RUN pip install ansible-lint

RUN pip install ansible

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
