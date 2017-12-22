# PaloAltoARMVMSS
ARM Template Palo Alto FW using Standard LB and HA Ports, deployed in VMSS for scaling.

https://docs.microsoft.com/en-us/azure/architecture/reference-architectures/dmz/nva-ha

https://docs.microsoft.com/en-us/azure/load-balancer/load-balancer-configure-ha-ports

Post Deployment Steps:

1. Execute PS CSE cseinstalliis.ps1
2. Determine PA FWs Egress PIP - (Get-AzureRmPublicIpAddress -ResourceGroupName xxxxx -VirtualMachineScaleSetName PAFWScaleSet | Where-Object {$_.Name –contains “PIP-FW-Egress”} ).IpAddress
3. Login PA FWs Egress PIP and load configuration - multi-ip-fw1 / multi-ip-fw2 , possibly modify - ensure internal ip matches, vmss sometimes does not execute internal ip sequentially
4. Cross Fingers

Future Needs:

1. CSE on backend Windows web servers to install IIS automatically
2. Look into Bootstrap method and custom image of PA FWs to pull in common configuration located in secure storage/repo/bastion/or/nfs
3. Determine method for output of vmss count n-tier #'s internal ip and pass into configuration file for bootstrap
