#Stage 1 - Install dependencies and build the app
FROM ubuntu:18.04 AS build-env

# Install flutter dependencies
RUN apt-get update 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback lib32stdc++6 python3 clang cmake ninja-build pkg-config libgtk-3-dev libblkid-dev liblzma-dev
RUN apt-get clean

# Clone the flutter repo
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"


# Run flutter doctor
RUN flutter doctor -v
RUN flutter channel stable
RUN flutter upgrade
RUN flutter config --enable-linux-desktop

WORKDIR /app/

EXPOSE 3000

CMD ["sh", "./start.sh"]