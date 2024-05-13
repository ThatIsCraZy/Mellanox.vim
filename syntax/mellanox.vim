" Vim syntax file
" Language: mellanox
" Maintainer: Makoto Momota <makoto.momota@gmail.com>

if exists("b:current_syntax")
  finish
endif

setlocal iskeyword+=-
setlocal iskeyword+=_

syn match   mellanoxDef        /\s\u\S\+/

syn keyword mellanoxCond       if else for-each
syn keyword mellanoxCond       to-zone from-zone match then from to match

syn keyword mellanoxLabel      system chassis firewall security rule rule-set pool

syn keyword mellanoxKeyword    version server class user address route nat policy vlan-id mtu
syn keyword mellanoxKeyword    filter term routing-instances routing-engine line-card next-hop
syn keyword mellanoxKeyword    cluster vrrp-group security-zone encapsulation storm-control
syn keyword mellanoxKeyword    alg log login node zone path community
syn match   mellanoxKeyword    /interfaces\?/
syn match   mellanoxKeyword    /vlans\?/
syn match   mellanoxKeyword    /members\?/
syn match   mellanoxKeyword    /applications\?/

syn keyword mellanoxProtocol   ip ipv6 inet inet6 tcp udp
syn keyword mellanoxProtocol   snmp snmptrap ntp syslog ssh ftp ftp-data dns sql spanning-tree
syn keyword mellanoxProtocol   ospf ospf3 rip ripng isis
syn keyword mellanoxProtocol   igmp igmp-snooping lldp lldp-med mld mld-snooping msdp mstp mvrp mpls vpls vrrp 
syn keyword mellanoxProtocol   stp sflow vstp dot1x msrp msrpc sunrpc icmp ping pim rstp rsvp netconf
syn match   mellanoxProtocol   /[ie]\?bgp/
syn match   mellanoxProtocol   /https\?/
syn match   mellanoxProtocol   /\s802\.3ad\s/
syn match   mellanoxProtocol   /\s802\.1Q\s/

" mellanox mlag like follows:
"  mlag-vig mlag-port-channel
syn match   mellanoxInterface   /\smlag\-[\-a-z]\+/

syn keyword mellanoxState     any deny permit accept reject discard disable enable no 
syn keyword mellanoxState  prefer active passive on
syn keyword mellanoxAction     shutdown force


syn keyword mellanox2ndParameter  switchport 
syn match mellanox2ndParameter   / lacp-individual /
syn match mellanox2ndParameter   / channel-group /
syn match mellanox2ndParameter   / mlag-channel-group /
syn keyword mellanox2ndParameter  speed ipl dcb
syn match   mellanox2ndParameter  /\([0-9]\)\@<= spanning-tree/
syn match   mellanox2ndParameter  /\([0-9]\)\@<= lacp /

syn match   mellanoxComment    / name /
syn match   mellanoxVar           /\(name\)\@<=.*/

syn match   mellanoxComment    /description/
syn match   mellanoxVar           /\(description\)\@<=.*/


syn keyword mellanoxCommandRefine   mode allowed-vlan rate peer-address except add priority-flow-control routing snooping
syn keyword mellanoxProtocol mlag mlag-vip clock lacp
syn match   mellanoxCommandRefine  /port type/

syn keyword mellanoxConfigure  set delete rename insert request show
syn keyword mellanoxPortType  trunk access static track standby hybrid fast edge
syn keyword mellanoxConfigure  full-duplex automatic auto-negotiation input output
syn keyword mellanoxConfigure  link-mode port-mode  queue
syn match   mellanoxConfigure  /\s\d\+[gm]/

syn keyword mellanoxFunction   redundancy-group screen policies flow zones vrf virtual-router
syn keyword mellanoxFunction   id host hostname priority weight protocol
syn keyword mellanoxFunction   source-address destination-address source-port destination-port
syn keyword mellanoxFunction   import export source destination
syn keyword mellanoxFunction   primary secondary neighbor
syn match   mellanoxFunction   /groups\?/
syn match   mellanoxFunction   /protocols\?/
syn match   mellanoxFunction   /unit\s[0-9]\+/
syn match   mellanoxFunction   /vlan\.[0-9]\+/
syn match   mellanoxFunction   /node[0-9]\+/

syn region  mellanoxComment    contained start='/*' end='*/'

syn match   mellanoxString     /\"[^"]*\"/

syn keyword mellanoxVar        low high all
syn match   mellanoxVar        /\d\+/

syn keyword mellanoxInterface  ethernet timezone system-mac port-channel
syn match   mellanoxInterface  /\(xe\|ge\|vcp\|gr\)\-[0-9]\+\/[0-9]\+\/[0-9]\+\(\|\n\|\s\|\.[0-9]\+\)/
syn match   mellanoxInterface  /\(ae\|reth\|fab\|vcp\|lo\)[0-9]\+\(\|\n\|\s\|\.[0-9]\+\)/
syn match   mellanoxInterface  /virtual\-chassis/
syn match   mellanoxInterface  /vlan\sunit\s[0-9]\+/

" IPv4
syn match   mellanoxIpv4       /\(25[0-5]\|2[0-4]\d\|[01]\?\d\{1,2}\)\(\.\(25[0-5]\|2[0-4]\d\|[01]\?\d\{1,2}\)\)\{3}\(\/[0-9]\{1,2\}\)\?/


hi link mellanoxKeyword        Statement
hi link mellanoxIpv4           NotifyTRACEIcon
hi link mellanoxPortType           NotifyTRACEIcon
hi link mellanoxProtocol       Type
hi link mellanoxAction         Error
hi link mellanoxInterface      Function
hi link mellanoxFunction       Function
hi link mellanoxConfigure      Function
hi link mellanoxLabel          Identifier
hi link mellanoxCond           Type
hi link mellanoxComment        Comment
hi link mellanoxString         String
hi link mellanoxVar            String
hi link mellanoxDef            String
hi link mellanoxState          Boolean
hi link mellanox2ndParameter   DiagnosticInfo
hi link mellanoxCommandRefine   DiagnosticHint



let b:current_syntax = "mellanox"
