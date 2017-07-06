# Galaxy - ChIP-Seq flavoured Galaxy
#
# VERSION       0.1

FROM bgruening/galaxy-stable:17.05

MAINTAINER Deepak K. Tanwar, dktanwar@hotmail.com

ENV GALAXY_CONFIG_BRAND="ChIP-Seq flavoured Galaxy"

RUN mkdir -p $GALAXY_HOME/workflows

# Adding the tool definitions to the container
ADD chip_seq_tool_list.yml $GALAXY_ROOT/chip_seq_tool_list.yml

# Install tools
RUN install-tools $GALAXY_ROOT/chip_seq_tool_list.yml

# Add workflow
ADD Galaxy-Workflow-ChIP_Seq_workflow.ga $GALAXY_ROOT/workflows/

# Download training data and populate the data library
RUN startup_lite && \
    sleep 30 && \
    workflow-install --workflow_path $GALAXY_HOME/workflows/ -u $GALAXY_DEFAULT_ADMIN_USER -p $GALAXY_DEFAULT_ADMIN_PASSWORD


# Add visualisations
#RUN curl -sL https://github.com/bgruening/galaxytools/archive/master.tar.gz > master.tar.gz && \
#    tar -xf master.tar.gz galaxytools-master/visualisations && \
#    cp -r galaxytools-master/visualisations/dotplot/ config/plugins/visualizations/ && \
#    cp -r galaxytools-master/visualisations/dbgraph/ config/plugins/visualizations/ && \
#    rm -rf master.tar.gz rm galaxytools-master

# Container Style
#ADD assets/img/full_logo.png $GALAXY_CONFIG_DIR/web/welcome_image.png
#ADD welcome.html $GALAXY_CONFIG_DIR/web/welcome.html
