# base image for automation testing QA
FROM ubuntu:20.04 
SHELL ["/bin/bash", "-c"]
RUN date
RUN ln -s /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
RUN apt-get update -y
RUN apt-get install -y groff less python3 python3-pip curl zip jq dbus tzdata -y
RUN pip install awscli && aws configure set default.region ap-southeast-1
RUN bash <(curl -sL https://get.graalvm.org/jdk) graalvm-ce-java17-22.3.1
RUN export PATH="/graalvm-ce-java17-22.3.1/bin:$PATH"
RUN export JAVA_HOME="/graalvm-ce-java17-22.3.1"
RUN java -version
RUN curl -s "https://get.sdkman.io" | bash
RUN "source $HOME/.sdkman/bin/sdkman-init.sh; sdk help; sdk install gradle 7.6"
RUN apt-get install -y chromium-browser chromium-chromedriver

