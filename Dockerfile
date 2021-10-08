FROM rocker/rstudio:4.1.1

ARG DEBIAN_FRONTEND=noninteractive

############################
# Install APT packages


# gawk for taxon-tools
# libxml2 for roxyglobals
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    libxml2-dev \
    gawk \
  && apt-get clean
  
#############################
# Other custom software

ENV APPS_HOME=/apps
RUN mkdir $APPS_HOME
WORKDIR $APPS_HOME

### taxon-tools ###
WORKDIR $APPS_HOME
ENV APP_NAME=taxon-tools
RUN git clone https://github.com/camwebb/$APP_NAME.git && \
	cd $APP_NAME && \
  git checkout 8f8b5e2611b6fdef1998b7878e93e60a9bc7c130 && \
	make check && \
	make install

############################
# Install R packages
RUN install2.r --error \
    assertr \
    assertthat \
    devtools \
    digest \
    dplyr \
    fs \
    glue \
    magrittr \
    pkgdown \
    processx \
    usethat \
    rmarkdown \
    remotes \
    testthat \
    tidyr

RUN R -e "remotes::install_github('anthonynorth/roxyglobals@*release')"

WORKDIR /home/rstudio/
