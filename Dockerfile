#
# Copyright © 2017 Sven Ruppert (sven.ruppert@gmail.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#FROM svenruppert/adopt:1.8.212-04
FROM jfrog-repo.sven-ruppert.de:8081/docker/ubuntu:latest
MAINTAINER sven.ruppert@gmail.com

ARG USER_HOME_DIR="/root"

RUN apt update && apt upgrade -y
RUN apt install curl -y
#RUN apt install sudo -y
#RUN apt install ufw -y

RUN curl -sL https://github.com/shyiko/jabba/raw/master/install.sh | \
    JABBA_COMMAND="install adopt@1.8.0-232 -o /jdk" bash

ENV JAVA_HOME /jdk
ENV PATH $JAVA_HOME/bin:$PATH
RUN java -version

#Firewall
EXPOSE 8899
#RUN sudo ufw allow 22
#RUN sudo ufw allow 8899
#RUN sudo ufw default deny
#RUN sudo ufw --force enable

COPY 03_demo/target/vaadin-app.jar .
CMD ["java", "-jar", "vaadin-app.jar"]