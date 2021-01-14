#!/bin/bash -xe
printf "log_group = \"${MasterLG}\"
state_file = \"/var/lib/journald-cloudwatch-logs/state\"" > /usr/local/etc/journald-cloudwatch-logs.conf

rm -f /var/lib/ethereum/geth/nodekey
rm /var/lib/ethereum/geth.ipc || true

systemctl enable geth-master.service
systemctl enable geth-tx.service
systemctl enable geth-peer-data.service

systemctl start geth-master.service || true &
sleep 5
systemctl start geth-tx.service
systemctl start geth-peer-data.service
