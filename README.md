# Deployment of Eigeningenuity Container with Docker Compose

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Feigen-ltd%2Fazure-docker-eigen%2Fmaster%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Feigen-ltd%2Fazure-docker-eigen%2Fmaster%2Fazuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

Built by: [jmspring](https://github.com/paulwfield)

This template allows you to deploy an CentOS Server VM with Docker (using the [Docker Extension][ext])
and starts a Docker instance listening on ports.  The data disk
for the dockers instances is an external disk mounted on the VM.  The container is created 
using the [Docker Compose][compose] capabilities of the [Azure Docker Extension][ext].

Below are the parameters that the template expects:

| Name   | Description    |
|:--- |:---|
| newStorageAccountName  | Unique DNS Name for the Storage Account where the Virtual Machine's disks will be placed. |
| vmName | The name of the VM |
| vmSize | The size of the VM |
| location | The location where the Virtual Machine will be deployed  |
| adminUsername  | Username for the Virtual Machine  |
| adminPassword  | Password for the Virtual Machine  |
| dnsNameForPublicIP  | Unique DNS Name for the Public IP used to access the Virtual Machine. |

[ext]: https://github.com/Azure/azure-docker-extension
[compose]: https://docs.docker.com/compose
