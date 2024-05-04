# 参考: https://dev.to/kummerer94/multi-stage-docker-builds-for-pyton-projects-using-uv-223g
# Base image
FROM python:3.12 as build

RUN apt-get update && apt-get install -y build-essential curl
ENV VIRTUAL_ENV=/opt/venv \
    PATH="/opt/venv/bin:$PATH"

ADD https://astral.sh/uv/install.sh /install.sh
RUN chmod -R 655 /install.sh && /install.sh && rm /install.sh
COPY ./requirements.lock .
RUN sed '/^-e/d' requirements.lock > requirements.txt
RUN /root/.cargo/bin/uv venv /opt/venv && \
    /root/.cargo/bin/uv pip install --no-cache -r requirements.txt

# App image
FROM python:3.12-slim-bookworm
ARG APPDIR="/var/www/tempapp"

COPY --from=build /opt/venv /opt/venv

WORKDIR ${APPDIR}
COPY ./src ${APPDIR}

# Activate the virtualenv in the container
# See here for more information:
# https://pythonspeed.com/articles/multi-stage-docker-python/
ENV PATH="/opt/venv/bin:$PATH"

CMD ["uvicorn", "tempapp.main:app", "--host", "0.0.0.0", "--port", "8000"]