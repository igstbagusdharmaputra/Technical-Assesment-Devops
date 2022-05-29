# pull base image
FROM alpine:3.13

# Labels.
LABEL maintainer="Ansible Docker" \
    org.label-schema.docker.cmd="docker run --rm -it -v $(pwd):/ansible ~/.ssh/id_rsa:/root/id_rsa dockerimage/ansible:2.11-alpine-3.13 || docker run --rm  --net=host -v ${pwd}:/ansible  dharmatkj/ansible-tool:latest ansible-playbook playbook.yml" 

RUN apk --no-cache add \
        bash \
        bash-completion \
        curl \
        grep \
        gettext \
        sudo \
        python3\
        py3-pip \
        openssl \
        ca-certificates \
        sshpass \
        openssh-client \
        rsync \
        git && \
    apk --no-cache add --virtual build-dependencies \
        python3-dev \
        libffi-dev \
        musl-dev \
        gcc \
        cargo \
        openssl-dev \
        libressl-dev \
        build-base && \
    pip3 install --upgrade pip wheel && \
    pip3 install --upgrade cryptography cffi && \
    pip3 install ansible-core==2.11.3 && \
    pip3 install mitogen ansible-lint jmespath && \
    pip3 install --upgrade pywinrm && \
    apk del build-dependencies && \
    rm -rf /var/cache/apk/* && \
    rm -rf /root/.cache/pip && \
    rm -rf /root/.cargo

RUN mkdir /ansible && \
    mkdir -p /etc/ansible

COPY ansible.cfg /etc/ansible/ansible.cfg
COPY hosts /etc/ansible/hosts

WORKDIR /ansible

CMD [ "ansible-playbook", "--version" ]