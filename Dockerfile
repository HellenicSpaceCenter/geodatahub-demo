FROM quay.io/jupyter/base-notebook:lab-4.3.5

# Use the built-in user
USER ${NB_USER}

# Move to the work dir
WORKDIR ${HOME}/work

# Install the python requirements in an early layer,
COPY --chown=${NB_UID}:${NB_GID} demoroot/requirements.txt .
RUN pip install --no-cache-dir -U -r requirements.txt

# Copy across the demo files
COPY --chown=${NB_UID}:${NB_GID} demoroot .
