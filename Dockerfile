# ─────────────────────────────────────────────
# HabitFlow — Dockerfile
# Serves static HTML via nginx
# ─────────────────────────────────────────────
FROM nginx:alpine

# Remove default nginx page
RUN rm -rf /usr/share/nginx/html/*

# Copy app files
COPY app/ /usr/share/nginx/html/

# Custom nginx config for SPA support
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -q --spider http://localhost/ || exit 1

CMD ["nginx", "-g", "daemon off;"]
