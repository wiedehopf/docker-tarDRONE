FROM ghcr.io/sdr-enthusiasts/docker-baseimage:python

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN set -x && \
  TEMP_PACKAGES=() && \
  KEPT_PACKAGES=() && \
  # packages needed to build Sniffle
  TEMP_PACKAGES+=(git) && \
  TEMP_PACKAGES+=(python3.11-venv) && \
  # dependencies for sniffle
  KEPT_PACKAGES+=(libusb-1.0-0-dev) && \
  KEPT_PACKAGES+=(libusb-1.0-0) && \
  # install packages
  apt-get update && \
  apt-get install -y --no-install-recommends \
  "${KEPT_PACKAGES[@]}" \
  "${TEMP_PACKAGES[@]}" \
  && \
  # Sniffle: get latest release from cemaexecutor (alphafox02)  \
  git clone --branch OpenDroneID --depth 1 --single-branch https://github.com/alphafox02/Sniffle /src/Sniffle && \
  # create system-wide virtual environment \
  python3 -m venv /src/venv

ENV PATH=/src/venv/bin:$PATH

RUN pip install -r /src/Sniffle/python_cli/requirements.txt \
