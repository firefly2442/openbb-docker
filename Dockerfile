# https://hub.docker.com/r/dorowu/ubuntu-desktop-lxde-vnc/
FROM dorowu/ubuntu-desktop-lxde-vnc:focal

# for the local apt-cacher-ng proxy, local development only
# RUN echo 'Acquire::HTTP::Proxy "http://192.168.1.226:3142";' >> /etc/apt/apt.conf.d/01proxy && \
#     echo 'Acquire::HTTPS::Proxy "false";' >> /etc/apt/apt.conf.d/01proxy

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - && \
    apt update && \
    apt install -y --no-install-recommends ca-certificates build-essential wget git-core python3 python3-pip python3-dev libgl1-mesa-glx libegl1-mesa libxrandr2 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6 && \
    apt upgrade -y && \
    apt autoremove -y && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /

RUN apt purge -y python3-requests && \
    pip3 install --no-cache-dir --upgrade poetry requests certifi && \
    git clone --recursive -b main --single-branch --depth=1 https://github.com/OpenBB-finance/OpenBBTerminal.git && \
    cd ./OpenBBTerminal/ && \
    poetry install --no-interaction --no-ansi

COPY run-openbb.sh /run-openbb.sh

RUN chmod +x run-openbb.sh

COPY OpenBB.desktop /root/Desktop/OpenBB.desktop
