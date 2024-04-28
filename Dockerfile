# Use the archlinux:base-devel image
FROM archlinux:base-devel

# Set the working directory
WORKDIR /root

# Combine all commands into a single RUN instruction
RUN pacman -Syu --noconfirm unzip wget && \
    wget https://dl.google.com/android/repository/commandlinetools-linux-7302050_latest.zip && \
    unzip commandlinetools-linux-7302050_latest.zip -d /opt/android-sdk && \
    echo 'export PATH=$PATH:/opt/android-sdk/cmdline-tools/bin' >> ~/.bashrc && \
    source ~/.bashrc && \
    yes | sdkmanager --licenses && \
    sdkmanager "platform-tools" "platforms;android-30" "build-tools;30.0.3"
