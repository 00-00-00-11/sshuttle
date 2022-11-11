FROM alpine:3.16

# Install packages
RUN apk add git python3 openssh iptables && \
    # Create ~/.ssh directory and ssh config
    mkdir -p /root/.ssh && chmod 700 /root/.ssh && echo -e "Host *\n\tStrictHostKeyChecking no\n" > ~/.ssh/config && \
    # Configure python
    ln -sf python3 /usr/bin/python && python3 -m ensurepip && pip3 install --no-cache --upgrade pip setuptools && \
    # Configure nameserver
    echo "nameserver 8.8.8.8" > /etc/resolv.conf && \
    # Download sshuttle
    mkdir /distr && cd /distr && git clone https://github.com/sshuttle/sshuttle.git && \
    # Install sshuttle
    cd /distr/sshuttle && ./setup.py install

# Copy docker entrypoint
COPY ./docker/docker-entrypoint.sh /docker-entrypoint.sh

# Permissions
RUN chmod +x /docker-entrypoint.sh

# Run entrypoint
ENTRYPOINT ["/docker-entrypoint.sh"]