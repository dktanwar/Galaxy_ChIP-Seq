# Galaxy - ChIP-Seq flavoured Galaxy
#
# VERSION       0.1

FROM bgruening/galaxy-stable

MAINTAINER Deepak K. Tanwar, dktanwar@hotmail.com


# Adding the tool definitions to the container
ADD my_tool_list.yml $GALAXY_ROOT/chip_seq_tool_list.yml

# Install deepTools
RUN install-tools $GALAXY_ROOT/chip_seq_tool_list.yml

# Mark folders as imported from the host.
VOLUME ["/export/", "/data/", "/var/lib/docker"]

# Expose port 80 (webserver), 21 (FTP server), 8800 (Proxy)
EXPOSE :80
EXPOSE :21
EXPOSE :8800

# Autostart script that is invoked during container start
CMD ["/usr/bin/startup"]
