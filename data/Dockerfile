# docker build -t kalabox/data .
FROM busybox

# Soon to be deprecated
VOLUME ["/data"]

# App code goes here
VOLUME ["/code"]

# Services that require data persistence go here
VOLUME ["/sql"]

CMD ["/bin/true"]
