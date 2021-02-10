# Get shiny+tidyverse packages from rocker image
FROM rocker/shiny-verse:4.0.3
    
# Set up a volume directory in the docker image
VOLUME /srv/shiny-server/   

# Set up a working directory in the docker image
WORKDIR /srv/shiny-server/

# Install system libraries of general use
RUN apt-get update && apt-get install -y \
    libudunits2-dev \
    libv8-dev \
    libsodium-dev 
  
# Install the required R packages to run the app
RUN R -e "install.packages('shinydashboard', dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('shinythemes', dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('shiny', dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('DT', dependencies=TRUE, repos='http://cran.rstudio.com/')"

# Expose ShinyApp to a local port
EXPOSE 3838

# Copy bash file that runs the shiny application to Docker image
COPY shiny-server.sh /usr/bin/shiny-server.sh

# Allow permission the files or directory
RUN ["chmod", "+rwx", "/srv/shiny-server/"] 
RUN ["chmod", "+x", "/usr/bin/shiny-server.sh"]

# Excute the bash file to run the app in the docker image
CMD ["/usr/bin/shiny-server.sh"]

