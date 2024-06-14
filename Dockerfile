FROM ubuntu:24.04

RUN apt update && apt install -y curl git unzip xz-utils zip libglu1-mesa openjdk-17-jdk wget cmake ninja-build clang pkg-config libgtk-3-dev
ENV WORKDIR_PATH /opt
WORKDIR $WORKDIR_PATH

#Installing Android SDK
RUN mkdir -p Android/sdk
ENV ANDROID_SDK_ROOT ${WORKDIR_PATH}/Android/sdk
RUN mkdir -p .android && touch .android/repositories.cfg
RUN wget -O sdk-tools.zip https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip
RUN unzip sdk-tools.zip && rm sdk-tools.zip
RUN mkdir -p Android/sdk/cmdline-tools
RUN mv cmdline-tools Android/sdk/cmdline-tools/latest
RUN cd Android/sdk/cmdline-tools/latest/bin && yes | ./sdkmanager --licenses
RUN cd Android/sdk/cmdline-tools/latest/bin && ./sdkmanager "build-tools;34.0.0" "platform-tools" "platforms;android-34" "sources;android-34"
ENV PATH "$PATH:${WORKDIR_PATH}/Android/sdk/platform-tools"

#Installing Flutter SDK
RUN git clone https://github.com/flutter/flutter.git
ENV PATH "$PATH:${WORKDIR_PATH}/flutter/bin"
RUN flutter channel stable
RUN flutter upgrade
