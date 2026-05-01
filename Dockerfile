FROM frappe/erpnext:version-15

USER frappe

# Copiamos la lista de apps y las instalamos en la imagen
COPY --chown=frappe:frappe apps.json /home/frappe/frappe-bench/apps.json

RUN cd /home/frappe/frappe-bench && \
    bench get-app --allow-fetch-multi-repo payments && \
    bench get-app --allow-fetch-multi-repo webshop

# No necesitas hacer 'install-app' aquí, eso se hace al crear el sitio
