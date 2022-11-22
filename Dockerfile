FROM jupyter/datascience-notebook:ubuntu-22.04

ARG USER_ID
ARG GROUP_ID
ARG PASSWORD

USER root
RUN jupyter lab build && \
    usermod -u $USER_ID jovyan && \
    groupmod -g $GROUP_ID users && \
    chown $USER_ID:$GROUP_ID /opt/conda && \
    HASH=$(python -c "from notebook.auth import passwd; print(passwd('$PASSWORD'))") && \
    echo "c.NotebookApp.password = u'$HASH'" \
      >> /home/jovyan/.jupyter/jupyter_notebook_config.py
USER jovyan

WORKDIR /home/jovyan/work
