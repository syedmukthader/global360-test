FROM nginx:1.27-alpine

# Ship the default NGINX welcome page as-is (satisfies "static web page /
# equivalent" requirement). Swap this COPY for your own index.html if you
# want custom content.
COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80

HEALTHCHECK --interval=15s --timeout=3s --retries=3 \
  CMD wget -qO- http://localhost/ || exit 1
