FROM alpine:3.15.0 AS builder
WORKDIR /build
ENV ANDROID_HOME /opt/android-sdk
ENV ANDROID_CMDLINE_TOOLS_ZIP "commandlinetools-linux-8092744_latest.zip"
RUN set -x \
  && apk -qU --no-cache add curl unzip=6.0-r9 ca-certificates=20211220-r0 \
  && curl -O -Ls "https://dl.google.com/android/repository/${ANDROID_CMDLINE_TOOLS_ZIP}" \
  && unzip -qq "${ANDROID_CMDLINE_TOOLS_ZIP}" \
  && mkdir -p "${ANDROID_HOME}/cmdline-tools" \
  && mv cmdline-tools "${ANDROID_HOME}/cmdline-tools/latest"

FROM openjdk:11-slim-bullseye

ENV ANDROID_HOME /opt/android-sdk
ENV PATH $PATH:${ANDROID_HOME}/cmdline-tools/latest/bin

COPY --from=builder ${ANDROID_HOME} ${ANDROID_HOME}

RUN set -x && apt-get update -qq \
  && apt-cache madison git ssh curl unzip libgnutls30 liblz4-1 libgcrypt20 libhogweed6 libnettle8 \
  && apt-get install -qq -y git=1:2.30.2-1 ssh=1:8.4p1-5 curl unzip=6.0-26 libgnutls30=3.7.1-5 liblz4-1=1.9.3-2 libgcrypt20=1.8.7-6 libhogweed6=3.7.3-1 libnettle8=3.7.3-1 --no-install-recommends \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && yes | sdkmanager --licenses >/dev/null \
  && sdkmanager platform-tools