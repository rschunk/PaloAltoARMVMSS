 > # PaloAltoARMVMSS
ARM Template Palo Alto FW using Standard LB and HA Ports, deployed in VMSS for scaling.

https://docs.microsoft.com/en-us/azure/architecture/reference-architectures/dmz/nva-ha

https://docs.microsoft.com/en-us/azure/load-balancer/load-balancer-configure-ha-ports

Post Deployment Steps:

1. Execute PS CSE cseinstalliis.ps1
2. Determine PA FWs Egress PIP - (Get-AzureRmPublicIpAddress -ResourceGroupName xxxxx -VirtualMachineScaleSetName PAFWScaleSet | Where-Object {$_.Name –contains “PIP-FW-Management”} ).IpAddress
3. Login PA FWs Egress PIP and load configuration - multi-ip-fw-xx where xx = to the internal network interface 10.0.0.xx of FW, (default username is "paloalto" and default password is "Pal0Alt0@123")
4. Cross Fingers

Future Needs:

1. CSE on backend Windows web servers to install IIS automatically
2. Look into Bootstrap method and custom image of PA FWs to pull in common configuration located in secure storage/repo/bastion/or/nfs > https://www.paloaltonetworks.com/documentation/71/virtualization/virtualization/bootstrap-the-vm-series-firewall/bootstrap-the-vm-series-firewall-in-azure
3. Determine method for output of vmss count n-tier #'s internal ip and pass into configuration file for bootstrap
