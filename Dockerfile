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

USER ${NB_USER}
