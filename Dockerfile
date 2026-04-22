ARG JAVA_VERSION=21
FROM eclipse-temurin:${JAVA_VERSION}-jdk-noble

# The software-properties-common package has been removed from Debian 13 (Trixie), and it is unclear if it will be re-added in the future.
RUN apt-get update -y && apt-get install -y gnupg wget nano apt-utils unzip bash-completion sudo lsb-release curl apt-transport-https ca-certificates
RUN sudo mkdir -p /etc/bash_completion.d/

# (for some env block http 80 port)
# For Ubuntu 24.04 LTS and newer (DEB822 format):
# Ubuntu 24.04 moved the default repository lists to a new .sources file format.
RUN sudo sed -i 's|http://|https://|g' /etc/apt/sources.list.d/ubuntu.sources

RUN apt-get update -y && apt install -y docker.io sudo pipx

# Remove the `ubuntu` user and add a user `coder` so that you're not developing as the `root` user
RUN userdel -r ubuntu && \
    useradd coder \
    --create-home \
    --shell=/bin/bash \
    --groups=docker \
    --uid=1000 \
    --user-group && \
    echo "coder ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers.d/nopasswd

USER coder
RUN pipx ensurepath # adds user's bin directory to PATH
