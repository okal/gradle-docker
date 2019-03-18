FROM openjdk:8-jdk

ENV GRADLE_HOME /opt/gradle
ENV GRADLE_VERSION 5.2.1

ARG GRADLE_DOWNLOAD_SHA256=748c33ff8d216736723be4037085b8dc342c6a0f309081acf682c9803e407357

RUN set -o errexit -o nounset
RUN echo "Downloading Gradle" && wget --no-verbose --output-document=gradle.zip "http://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip"
RUN echo "Checking download hash" && echo "${GRADLE_DOWNLOAD_SHA256} *gradle.zip" | sha256sum --check
RUN echo "Installing Gradle" && unzip gradle.zip && rm gradle.zip \
    && mv "gradle-${GRADLE_VERSION}" "${GRADLE_HOME}/" \
    && ln --symbolic "${GRADLE_HOME}/bin/gradle" /usr/bin/gradle

RUN set -o errexit -o nounset \
    && echo "Testing Gradle installation" \
    && gradle --version

CMD ["gradle"]
