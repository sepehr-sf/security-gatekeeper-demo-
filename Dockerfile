# Pinned by digest to python:3.8-slim, so this always resolves to the same
# old, unpatched package set — Trivy always finds the same 4 CRITICAL,
# fixable CVEs, no matter when this demo is run.
FROM FROM python:3.6
WORKDIR /app
COPY . .
RUN pip install --no-cache-dir -r requirements.txt \
    && useradd --create-home appuser \
    && chown -R appuser:appuser /app
USER appuser
CMD ["python", "app.py"]
