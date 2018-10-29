FROM python:3.7.1-stretch

RUN export ACCEPT_EULA=Y && \
\
    apt-get update && \
    apt-get install -y apt-utils apt-transport-https && \
\
    curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    curl https://packages.microsoft.com/config/debian/9/prod.list > /etc/apt/sources.list.d/mssql-release.list && \
\
    apt-get update && \
    apt-get install -y msodbcsql17 unixodbc-dev mssql-tools locales nano netcat && \
\
    echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile && \
    echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc && \
\
    echo "C.UTF-8 UTF-8" > /etc/locale.gen && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && locale-gen && \
\
    pip install pyodbc ipython


ENTRYPOINT ["python"]

CMD ["-m", "IPython"]
