FROM virgiliosantos/bradoo-image-pip

USER root

# ADD ssh /home/odoo/.ssh
ADD ssh /root/.ssh
COPY ./odoo.conf /etc/odoo/
RUN mkdir /home/odoo/opt

# RUN chown -R odoo:odoo /var/log/odoo
# RUN chown -R odoo:odoo /home/odoo/opt
# RUN chown -R odoo:odoo /home/odoo/.ssh

COPY entrypoint.sh /  
COPY repolist.txt /
ADD _.sh .

# RUN ssh-keyscan -t rsa github.com > /home/odoo/.ssh/known_hosts 
RUN ssh-keyscan -t rsa github.com > /root/.ssh/known_hosts 

RUN ./_.sh

ENTRYPOINT ["/entrypoint.sh"]

# USER root
# RUN rm -r /home/odoo/.ssh _.sh
RUN rm -r /root/.ssh _.sh

EXPOSE 8069 8071

USER odoo


CMD ["odoo"]
