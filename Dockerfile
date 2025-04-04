FROM quay.io/jupyter/minimal-notebook:python-3.12.9
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

LABEL org.opencontainers.image.authors="Jose Sanchez-Gallego, gallegoj@uw.edu"
LABEL org.opencontainers.image.source=https://github.com/uw-astr-480/jupyterhub-image

RUN pip install ipython astropy numpy matplotlib seaborn scipy pandas polars photutils

# Using GRANT_SUDO=yes does not work because we would need to run the container as root
# and UW doesn't seem to allow that. Instead we modify the image to manually add the
# user to the sudoers file.
USER root

RUN echo "${NB_USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Add hook to set up an ssh key
RUN mkdir -p /usr/local/bin/before-notebook.d
COPY create-ssh-key.sh /usr/local/bin/before-notebook.d/

# Install packages as root
RUN apt-get update && apt-get install -y \
    htop \
    build-essential \
    vim \
    git \
    tree

USER ${NB_USER}

RUN mkdir -p ~/.ssh && chmod 700 ~/.ssh

RUN  git config --global pull.rebase false

ENV UV_PYTHON="3.12"
