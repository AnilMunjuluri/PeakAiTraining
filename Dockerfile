# Peak's workflow-python-standard-pack image (Python 3.8.13)
# https://github.com/peak-ai/platform-global-images/tree/main/workflow/python/standard-pack
FROM 794236216820.dkr.ecr.eu-west-1.amazonaws.com/default-images:workflow-python-standard-pack-1.0.0-base-python-3.8.13

# ------------------------------------------------
# Non-root user (required by Peak Workflows)
# ------------------------------------------------
ARG PEAK_USER_ID=8877
ENV PEAK_USER_ID=$PEAK_USER_ID

RUN id peak-user || useradd -l -m -d /home/peak-user -u $PEAK_USER_ID peak-user

WORKDIR /home/peak-user

COPY --chown=peak-user hello_world.py .

USER $PEAK_USER_ID

CMD ["python", "hello_world.py"]
