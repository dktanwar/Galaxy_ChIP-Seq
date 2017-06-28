# Galaxy - ChIP-Seq flavoured Galaxy
#
# VERSION       0.1

FROM bgruening/galaxy-stable

MAINTAINER Deepak K. Tanwar, dktanwar@hotmail.com


# Adding the tool definitions to the container
ADD chip_seq_tool_list.yml $GALAXY_ROOT/chip_seq_tool_list.yml

# Install tools
RUN install-tools $GALAXY_ROOT/chip_seq_tool_list.yml

RUN mkdir -p $GALAXY_HOME/workflows

# Mark folders as imported from the host.
VOLUME ["/export/", "/data/", "/var/lib/docker"]

# Expose port 80 (webserver), 21 (FTP server), 8800 (Proxy)
EXPOSE :80
EXPOSE :21
EXPOSE :8800

# Autostart script that is invoked during container start
CMD ["/usr/bin/startup"]

ADD Galaxy-Workflow-ChIP_Seq_workflow.ga $GALAXY_ROOT/workflows/

RUN startup_lite && \
    sleep 30 && \
    workflow-install --workflow_path $GALAXY_HOME/workflows/ -g http://localhost:8080 -u $GALAXY_DEFAULT_ADMIN_USER -p $GALAXY_DEFAULT_ADMIN_PASSWORD
