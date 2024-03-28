/interface bridge
add igmp-snooping=yes igmp-version=3 name=bridge protocol-mode=none vlan-filtering=yes

/interface vlan
add interface=bridge name=vlan_mgnt vlan-id=99

/interface list
add name=WAN
add name=MGMT

/ip pool
add name=pool_mgmt ranges=192.168.0.10-192.168.0.254

/ip dhcp-server
add address-pool=pool_mgmt interface=vlan_mgnt name=mgmt_dhcp

/interface bridge port
add bridge=bridge frame-types=admit-only-untagged-and-priority-tagged interface=ether2 pvid=99

/interface bridge vlan
add bridge=bridge tagged=bridge vlan-ids=99

/interface list member
add interface=vlan_mgnt list=MGMT

/ip address
add address=192.168.0.1/24 interface=vlan_mgnt network=192.168.0.0

/ip dhcp-server network
add address=192.168.0.0/24 dns-server=192.168.0.1 gateway=192.168.0.1

/system identity
set name=av-router
