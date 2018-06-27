#----------------------------
# EVA-EOS-DEV-Base
# EvaCoop base image of EVA-EOS-DEV
#----------------------------
# VERSION 1.1.0
# AUTHOR: Merouane Benthameur
# DESCRIPTION: base image of EVA-EOS-DEV

FROM eosio/eos-dev:v1.0.4
MAINTAINER Merouane Benthameur <merouane.benthameur@eva.coop>
LABEL authors="merouane.benthameur@eva.coop"

COPY ./contracts-entrypoint.sh /
COPY ./contracts /opt/eosio/bin/data-dir/contracts

RUN chmod +x /contracts-entrypoint.sh
