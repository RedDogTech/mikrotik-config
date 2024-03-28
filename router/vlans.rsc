/interface vlan
add interface=bridge name=vlan_data vlan-id=10
add interface=bridge name=vlan_control vlan-id=20
add interface=bridge name=vlan_ndi vlan-id=30
add interface=bridge name=vlan_dante vlan-id=40
add interface=bridge name=vlan_dmx vlan-id=50

/interface list member
add interface=vlan_data list=VLAN
add interface=vlan_control list=VLAN
add interface=vlan_ndi list=VLAN
add interface=vlan_dante list=VLAN
add interface=vlan_dmx list=VLAN

/ip pool
add name=pool_data ranges=10.0.10.2-10.0.10.254
add name=pool_control ranges=10.0.20.2-10.0.20.254
add name=pool_ndi ranges=10.0.30.2-10.0.30.254
add name=pool_dante ranges=10.0.40.2-10.0.40.254
add name=pool_dmx ranges=10.0.50.2-10.0.50.254

/ip address
add address=10.0.10.1/24 interface=vlan_data network=10.0.10.0
add address=10.0.20.1/24 interface=vlan_control network=10.0.20.0
add address=10.0.30.1/24 interface=vlan_ndi network=10.0.30.0
add address=10.0.40.1/24 interface=vlan_dante network=10.0.40.0
add address=10.0.50.1/24 interface=vlan_dmx network=10.0.50.0

/ip dhcp-server
add address-pool=pool_data interface=vlan_data name=dhcp_data
add address-pool=pool_control interface=vlan_control name=dhcp_control
add address-pool=pool_ndi interface=vlan_ndi name=dhcp_ndi
add address-pool=pool_dante interface=vlan_dante name=dhcp_dante
add address-pool=pool_dmx interface=vlan_dmx name=dhcp_dmx

/ip dhcp-server network
add address=10.0.10.0/24 dns-server=192.168.0.1 gateway=192.168.0.1
add address=10.0.20.0/24 dns-server=192.168.0.1 gateway=192.168.0.1
add address=10.0.30.0/24 dns-server=192.168.0.1 gateway=192.168.0.1
add address=10.0.40.0/24 dns-server=192.168.0.1 gateway=192.168.0.1
add address=10.0.50.0/24 dns-server=192.168.0.1 gateway=192.168.0.1

/interface bridge vlan
add bridge=bridge tagged=bridge vlan-ids=10
add bridge=bridge tagged=bridge vlan-ids=20
add bridge=bridge tagged=bridge vlan-ids=30
add bridge=bridge tagged=bridge vlan-ids=40
add bridge=bridge tagged=bridge vlan-ids=50
