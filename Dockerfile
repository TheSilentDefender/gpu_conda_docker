FROM continuumio/miniconda:4.7.12

RUN set -x && \
    wget https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/cuda-wsl-ubuntu.pin && \
    mv cuda-wsl-ubuntu.pin /etc/apt/preferences.d/cuda-repository-pin-600
RUN set -x && \
    wget -q https://developer.download.nvidia.com/compute/cuda/11.7.0/local_installers/cuda-repo-wsl-ubuntu-11-7-local_11.7.0-1_amd64.deb && \
    dpkg -i cuda-repo-wsl-ubuntu-11-7-local_11.7.0-1_amd64.deb && \
    rm cuda-repo-wsl-ubuntu-11-7-local_11.7.0-1_amd64.deb
RUN set -x && \
    cp /var/cuda-repo-wsl-ubuntu-11-7-local/*.gpg /usr/share/keyrings/ && \
    apt-get update && \
    apt-get -y install cuda

    