FROM python:3.13-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    graphviz \
    make \
    && rm -rf /var/lib/apt/lists/*

RUN git config --global --add safe.directory /work

WORKDIR /work

COPY pyproject.toml uv.lock ./
COPY . .

RUN pip install --no-cache-dir --upgrade setuptools wheel && \
    pip install --no-cache-dir . sphinx-autobuild

CMD ["sphinx-build", "-b", "html", "-d", "/tmp/doctrees", "docs/source", "/site"]
