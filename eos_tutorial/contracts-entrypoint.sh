#!/bin/bash
################################################################################
#
# Scrip Created by http://Eva.Coop
# EOSNode
#
# Authors: max.gravitt@eva.coop,raphael.gaudreault@eva.coop,
#          merouane.benthameur@eva.coop
#
################################################################################

alias cleos='docker-compose exec keosd /opt/eosio/bin/cleos -u http://nodeosd:8888 --wallet-url http://keosd:8900'
PUBKEY="EOS7ckzf4BMgxjgNSYV22rtTXga8R9Z4XWVhYp8TBgnBi2cErJ2hn"
PRIVKEY="5JhhMGNPsuU42XXjZ57FcDKvbb7KLrehN65tdTQFrH51uruZLHi"

# Create defauls Wallet
cleos wallet create > /opt/eosio/bin/data-dir/contracts/wallet_private_key.txt
cleos wallet import "5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3"
cleos wallet import "5JhhMGNPsuU42XXjZ57FcDKvbb7KLrehN65tdTQFrH51uruZLHi"
cleos wallet import $PRIVKEY

# Create Accounts
cleos create account eosio dominic $PUBKEY $PUBKEY
cleos create account eosio bruno $PUBKEY $PUBKEY
cleos create account eosio eva $PUBKEY $PUBKEY


cleos create account eosio eosio.token $PUBKEY $PUBKEY
eosiocpp -o /opt/eosio/bin/data-dir/contracts/eosio.token/eosio.token.wast /opt/eosio/bin/data-dir/contracts/eosio.token/eosio.token.cpp &&
eosiocpp -g /opt/eosio/bin/data-dir/contracts/eosio.token/eosio.token.abi /opt/eosio/bin/data-dir/contracts/eosio.token/eosio.token.cpp &&
cleos set contract eosio.token /opt/eosio/bin/data-dir/contracts/eosio.token


cleos push action eosio.token create '["eva","100000000.0000 EVA","initial balance"]' -p eosio.token
cleos push action eosio.token issue '["eva","100000000.0000 EVA","initial balance"]' -p eva
cleos push action eosio.token transfer '["eva","dominic","1000000.0000 EVA","initial balance"]' -p eva
cleos push action eosio.token transfer '["eva","bruno","1000000.0000 EVA","initial balance"]' -p eva





