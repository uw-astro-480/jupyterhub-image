FROM jupyter/minimal-notebook:latest
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

LABEL org.opencontainers.image.authors="Jose Sanchez-Gallego, gallegoj@uw.edu"
LABEL org.opencontainers.image.source=https://github.com/uw-astr-480/jupyterhub-image
