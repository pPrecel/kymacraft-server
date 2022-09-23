# image builder base on alpine:3.16.2
FROM alpine@sha256:1304f174557314a7ed9eddb4eab12fed12cb0cd9809e4c28f29af86979a3c870

ENV NEWUSER=appuser

RUN addgroup -g 2000 -S appgroup \
    && adduser -u 1000 -S $NEWUSER -G appgroup

RUN apk update
RUN apk add git git-lfs openssh-client bash sudo
RUN git lfs install

USER $NEWUSER
