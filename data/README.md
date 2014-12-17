Kalabox Data
===================

Data container also containing some plugins for skydock

```

# docker build -t kalabox/data .

FROM busybox

COPY data /data

VOLUME ["/data"]

CMD ["/bin/true"]

```
