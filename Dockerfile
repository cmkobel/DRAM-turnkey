FROM continuumio/miniconda3

WORKDIR /app

# Create the environment:
RUN git clone https://github.com/WrightonLabCSU/DRAM.git DRAM
RUN conda env create -f DRAM/environment.yaml --name DRAM

SHELL ["/bin/bash", "--login", "-c"]



RUN wget --quiet http://ns9864k.web.sigma2.no/TheMEMOLab/cmkobel/dram_bak_2022_sep.tar.gz
RUN tar -xf dram_bak_2022_sep.tar.gz
RUN ls -lh DRAM || echo could not



# Load conda so we can activate the environment
RUN source /opt/conda/etc/profile.d/conda.sh
RUN conda activate /opt/conda/envs/DRAM



#### Old below


# This is my alternative to adding the path
#RUN source activate /opt/conda/envs/DRAM/







# Instead of jumping through loops to activate the conda env, we can just load the bin-directory.
#ENV PATH /opt/conda/envs/DRAM/bin:$PATH


# Install databases
#RUN /opt/conda/envs/DRAM/bin/DRAM-setup.py prepare_databases --output_dir DRAM_data


# Verbosely show the version number to the user each time.
#ENTRYPOINT DRAM-setup.py version


