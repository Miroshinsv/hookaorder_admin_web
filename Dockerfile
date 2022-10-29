FROM ubuntu as builder

RUN apt-get update
RUN apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback lib32stdc++6 python3
RUN apt-get clean

# download Flutter SDK from Flutter Github repo
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

# Set flutter environment path
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Enable flutter web
RUN flutter channel master
RUN flutter upgrade

# Copy files to container and build
RUN mkdir /app/
COPY . /app/
WORKDIR /app/

# Build flutter web project
RUN rm -Rf .packages
RUN flutter clean
RUN dart pub get
RUN flutter pub get
RUN flutter pub run build_runner build --delete-conflicting-outputs
RUN flutter build web

RUN tar -cvf build.tar build/web

FROM nginx
COPY --from=builder /app/build.tar /usr/share/nginx/html/
RUN tar -xvf /usr/share/nginx/html/build.tar -C /usr/share/nginx/html/ --strip-components=2