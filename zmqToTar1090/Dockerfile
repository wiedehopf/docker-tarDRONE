FROM ghcr.io/sdr-enthusiasts/docker-baseimage:python

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN set -x && \
  TEMP_PACKAGES=() && \
  KEPT_PACKAGES=() && \
  # packages needed to install
  TEMP_PACKAGES+=(git) && \
  # packages needed to build Sniffle
  KEPT_PACKAGES+=(python3.11-venv) && \
  # install packages
  apt-get update && \
  apt-get install -y --no-install-recommends \
  "${KEPT_PACKAGES[@]}" \
  "${TEMP_PACKAGES[@]}" \
  && \
  # zmqToTar1090: get latest release from l0g-lab \
  git clone --branch main --depth 1 --single-branch https://github.com/l0g-lab/zmqToTar1090 /src/zmqToTar1090 && \
  # create system-wide virtual environment \
  python3 -m venv /src/venv

ENV PATH=/src/venv/bin:$PATH

RUN pip install -r /src/zmqToTar1090/requirements.txt \
