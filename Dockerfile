FROM quay.io/jupyter/minimal-notebook:python-3.12.9
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

LABEL org.opencontainers.image.authors="Jose Sanchez-Gallego, gallegoj@uw.edu"
LABEL org.opencontainers.image.source=https://github.com/uw-astr-480/jupyterhub-image

RUN pip install ipython astropy numpy matplotlib seaborn scipy pandas polars photutils

ENV GRANT_SUDO=yes
