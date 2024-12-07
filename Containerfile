FROM fedora:latest
RUN dnf -yqq install nginx hostname &>/dev/null  && \
    echo "Hello, from container $(hostname)" > /usr/share/nginx/html/index.html && \
    sed -i '/::*80/s/^/#/' /etc/nginx/nginx.conf && \
    dnf upgrade -y && \
    apk -v install tuxpaint && \
    apk -v install vim 
EXPOSE 80
ENTRYPOINT /usr/sbin/httpd -DFOREGROUND
CMD nginx -g 'daemon off;'

