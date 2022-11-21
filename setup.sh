#!/bin/bash

# install dependencies
sudo apt install stress-ng

# link services
sudo ln -s ./services/heat.service /lib/systemd/system/heat.service

# restart service demon to load new services
sudo systemctl daemon-reload

# enable and start services
sudo systemctl enable heat.service 
sudo systemctl start heat.service 