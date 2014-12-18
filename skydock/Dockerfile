# A small little container that acts as the SkyDock executable
# docker build -t kalabox/skydock .
# docker run -d --volumes-from kalabox_data -v /var/run/docker.sock:/docker.sock -v /skydock.js:/skydock.js --name kalabox_skydock kalabox/skydock
# may still need to append:
# -ttl 30 -environment dev -s /docker.sock -domain kbox -name kalabox_skydns -plugins /data/config/skydock.js

FROM kalabox/debian

RUN \
  curl -L https://github.com/kalabox/skydock/releases/download/v0.2.0/skydock > /skydock && \
  chmod 777 /skydock

ENTRYPOINT ["/skydock", "-ttl", "30", "-environment", "dev"]
CMD ["-s", "/docker.sock", "-domain", "kbox", "-name", "kalabox_skydns", "-plugins", "/data/config/skydock.js"]
