# docker-nebliod
Docker Containers for nebliod

neblioteam/buildpack-deps: A base Ubuntu 16.04 docker container with dependencies installed to build nebliod

neblioteam/nebliod-build: A container for building the latest version of nebliod, and then syncing and saving the blockchain

neblioteam/nebliod: The main nebliod container that end users will use. Instantly launches and starts nebliod with a fully-synced blockchain.

neblioteam/nebliod-testnet: Instantly launches and starts nebliod with a fully-synced blockchain on testnet.

Quick Start
===========

Prerequisites: Any system with docker installed. https://docs.docker.com/engine/installation/

To launch a fully functional nebliod node, with QuickSync simply run the following command:

    sudo docker run -i -t --rm --name nebliod -v $HOME/neblio-data:/root/.neblio -p 6325:6325 neblioteam/nebliod

Blockchain data and nebliod configuration files will be persistently stored on the local machine at $HOME/neblio-data
