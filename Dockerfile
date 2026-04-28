# ─────────────────────────────────────────────
# HabitFlow — Dockerfile
# Serves static HTML via nginx
# ─────────────────────────────────────────────
FROM public.ecr.aws/nginx/nginx:alpine

# Remove default nginx page
RUN rm -rf /usr/share/nginx/html/*

# Copy app files
COPY . /usr/share/nginx/html/


EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -q --spider http://localhost/ || exit 1

CMD ["nginx", "-g", "daemon off;"]
