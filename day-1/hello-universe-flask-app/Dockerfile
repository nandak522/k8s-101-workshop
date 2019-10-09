FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive PYTHONUNBUFFERED=1

RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential \
    curl \
    less \
    lsof \
    net-tools \
    python3-dev \
    python3-pip \
    software-properties-common \
    strace \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /service
COPY requirements.txt .
COPY app.py .
RUN pip3 install -r requirements.txt
EXPOSE 9999
CMD ["python3", "app.py"]
