Following are the configuration steps for GCP Fortigate Firewall appliance


## firewall01 HA commands

```
config system ha 
set group-name fortigates
set mode a-p
set hbdev "port3" 100
set session-pickup enable
set session-pickup-connectionless enable
set ha-mgmt-status enable
config ha-mgmt-interfaces
edit 1
set interface "port4"
set gateway 10.108.0.193
next
end
set override disable
set priority 255
set unicast-hb enable
set unicast-hb-peerip 10.108.0.130
set unicast-hb-netmask 255.255.255.192
end
config system sdn-connector
edit "gcp_conn"
set type gcp
set ha-status enable
config external-ip
edit "abdecnr-port1-public-active-eip"
next
end
config route
edit "internal-route"
next
end
next
end
```

## firewall02 HA commands

```
config system ha 
set group-name fortigates
set mode a-p
set hbdev "port3" 100
set session-pickup enable
set session-pickup-connectionless enable
set ha-mgmt-status enable
config ha-mgmt-interfaces
edit 1
set interface "port4"
set gateway 10.108.0.193
next
end
set override disable
set priority 155
set unicast-hb enable
set unicast-hb-peerip 10.108.0.131
set unicast-hb-netmask 255.255.255.192
end
config system sdn-connector
edit "gcp_conn"
set type gcp
set ha-status enable
config external-ip
edit "abdecnr-port1-public-active-eip"
next
end
config route
edit "internal-route"
next
end
next
end
```