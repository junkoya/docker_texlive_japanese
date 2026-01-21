FROM debian:13-slim
LABEL maintainer="Satoshi Yammamto"
RUN apt update && apt upgrade -y && apt install -y wget perl libfontconfig
RUN cd /tmp && wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && tar zxvf install-tl-unx.tar.gz; cd install-tl-20* && \
./install-tl -no-interaction -no-doc-install -no-src-install -scheme bookpub
ENV PATH="/usr/local/texlive/2025/bin/x86_64-linux:${PATH}"
RUN tlmgr update --self --all && tlmgr install collection-langjapanese
RUN apt install -y pandoc
RUN apt install -y fonts-noto-cjk-extra
ENTRYPOINT [ "pandoc" ]