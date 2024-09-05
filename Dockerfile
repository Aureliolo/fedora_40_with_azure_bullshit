# Use Fedora as the base image
FROM fedora:40

# Update the package list for Fedora 40
RUN dnf -y update

# Install su and sudo packages
RUN dnf install -y sudo util-linux

# Install python and pip
RUN dnf install -y python3-pip

# Install ansible
RUN pip3 install ansible ansible-lint ansible-dev-tools requests jmespath

#Install ansible galaxy requirements
RUN ansible-galaxy collection install ansible.posix && \
    ansible-galaxy collection install community.vmware && \
    ansible-galaxy collection install ansible.windows && \
    ansible-galaxy collection install community.windows && \
    ansible-galaxy collection install community.general

# Clean up any unused packages and files
RUN dnf clean all && rm -rf /var/cache/dnf
