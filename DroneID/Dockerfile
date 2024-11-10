FROM ghcr.io/sdr-enthusiasts/docker-baseimage:python

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN set -x && \
  TEMP_PACKAGES=() && \
  KEPT_PACKAGES=() && \
  # packages needed to build DroneID
  TEMP_PACKAGES+=(git) && \
  TEMP_PACKAGES+=(python3.11-venv) && \
  # install packages
  apt-get update && \
  apt-get install -y --no-install-recommends \
  "${KEPT_PACKAGES[@]}" \
  "${TEMP_PACKAGES[@]}" \
  && \
  # DroneID: get latest release of DroneID from bkerler  \
  git clone --branch main --depth 1 --single-branch https://github.com/bkerler/DroneID /src/DroneID && \
  # create system-wide virtual environment \
  python3 -m venv /src/venv

ENV PATH=/src/venv/bin:$PATH

RUN pip install -r /src/DroneID/requirements.txt \
