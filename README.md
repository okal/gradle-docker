# gradle-docker

This is an alternative to the officially blessed Gradle Docker image.
The official image creates a separate, non-root, user `gradle` within the image, leading to
annoyances surrounding Unix permissions¹², making it especially painful 

This alternative image basically riffs off the original (credit to Keegan Witt³), removing any
ownership assignments from the Dockerfile, but otherwise leaving it intact. It also only supports
JDK 8, because that's all I care about. If you care about a different JDK version, please file a PR.


## References
1. https://hub.docker.com/_/gradle?tab=reviews
2. https://discuss.gradle.org/t/docker-image-permission-issue/25149/3
3. https://github.com/keeganwitt/docker-gradle
