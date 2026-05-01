FROM frappe/erpnext:version-15

USER frappe

# Copiar la lista de aplicaciones
COPY --chown=frappe:frappe apps.json /home/frappe/frappe-bench/apps.json

# Descargar las aplicaciones dentro de la imagen
RUN cd /home/frappe/frappe-bench && \
    bench get-app --allow-fetch-multi-repo payments && \
    bench get-app --allow-fetch-multi-repo webshop
