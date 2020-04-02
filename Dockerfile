FROM alpine

RUN echo "hello world"
CMD ["/bin/sh","-c", " while true;do echo hello docker;sleep 1;done"]