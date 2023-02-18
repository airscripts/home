FROM alpine:3.17 AS builder
  ARG HOME_BUILD_ENVIRONMENT=docker
  WORKDIR /home
  COPY . .

  RUN \
    sh scripts/update.sh && \
    sh scripts/install/bash.sh && \
    bash scripts/install/make.sh

  RUN \
    make install-git environment=${HOME_BUILD_ENVIRONMENT} && \
    make submodules environment=${HOME_BUILD_ENVIRONMENT}

FROM alpine:3.17 AS runner
  LABEL maintainer="Airscript <francesco@airscript.it>"
  ENV HOME_PORT=25001
  ENV HOME_INTERFACE=0.0.0.0
  WORKDIR /home
  COPY --from=builder /home ./
  
  RUN \
    sh scripts/update.sh && \
    sh scripts/install/bash.sh && \
    bash scripts/install/make.sh && \
    make install-hugo
  
  ENTRYPOINT [".docker/scripts/home.docker-entrypoint.sh"]
  CMD ["hugo"]
  EXPOSE ${HOME_PORT}