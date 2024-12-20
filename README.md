#Deployment of static website using ACI (Docker)
__________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________

#Project overview: 
__________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________
Deployment of Static Website Using Azure Container Instances (ACI)
#Project Goal:
To efficiently and cost-effectively deploy a static website to Azure using Azure Container Instances (ACI), leveraging its server less nature and rapid deployment capabilities.
#Project Scope:
•	Static Website: A collection of  HTML, CSS and JS files that don't require server-side processing.
•	Azure Container Instance (ACI): A server less container service that allows you to run containers without managing virtual machines.
Technologies and Azure Services Used:
1.	Azure CLI: Used to create the resource group, ACR (Azure Container Registry) and ACI (Azure Container Instance).
2.	ARM Template: Automated the creation of ACR & ACI.
3.	ACR: we deploy our static website image into the azure container registry.
4.	ACI: A server less container service that allows you to run containers
5.	Docker: Used to build image and push it into the ACR.
6.	Dokerfile: It is used to define the environment for your static website (nginx).
7.	GIT: Cloned the website from GitHub using a custom script.

Project Approach:
1.	Create the resource group using custom azure cli commands:
[az group create - -name <resource-group-name> - -location <location-name> --verbose]
Ex: az group create --name rg2024 -- location eastus --verbose 

![image](https://github.com/user-attachments/assets/78996d36-2489-45a8-99e1-7712deea04db)

2.	Create the Azure container registry using the ARM template:
ARM template is a JSON file that defines the infrastructure and configuration for your Azure resources. It's a declarative way to specify what resources you want to deploy, rather than writing a series of commands to deploy them.
Here we used the ARM template to create the resource ACR (azure container registry).
![image](https://github.com/user-attachments/assets/ec4362f7-8f0f-4d50-9140-d991894fdeb2)

Deploy this ARM template in the resource group of RG1 by using the below command from .Json file path.

[az deployment group create --resource-group rg2024  --template-file containerRegistry.json --verbose]
![image](https://github.com/user-attachments/assets/7903ddd4-f178-48c3-b872-e65df0905eb9)
![image](https://github.com/user-attachments/assets/48b94b37-cb48-4097-81ca-3abfcd226e3e)

Graphical user interface or portal view:
![image](https://github.com/user-attachments/assets/906f95f8-f133-451e-b891-569a48a772cc)

 

3.	Create the Docker file to configure the static website with nginx web 
server using ARM template.

  Dockerfile:
  ![image](https://github.com/user-attachments/assets/5f792d68-c828-4fb5-8715-13c40a83851c)

4.	Download Docker from its official website - https://www.docker.com/products/docker-desktop/
   ![image](https://github.com/user-attachments/assets/7d7cdb95-dcd5-4f8d-adce-d3237d5c09ff)
5.	Now build the image from the dockerfile:
   ![image](https://github.com/user-attachments/assets/56fec125-270a-457e-8e4b-e759cfbfbc9f)
6.	Login to the azure container registry, then tag the image and push into it.
   ![image](https://github.com/user-attachments/assets/dbe75a9d-92c6-4bbd-84fd-8aa4bb0ab487)
  	The azure CLI command to push image into ACR is given below
  	Docker push <registry-server-name/image-name>
  	![image](https://github.com/user-attachments/assets/87600a79-765a-4da9-9d89-fe5fb31a1811)
  	Image is uploaded in the azure container registry as show below figure.
  	![image](https://github.com/user-attachments/assets/55b9e479-2a5d-4517-a861-e093055f9a6f)
7.	Creating of azure container instance (ACI) using Azure CLI.

      Here we used the ARM template to create the resource ACI (azure container instance),
       [Copy  Login server, Username and Password  and  Paste in the ARM Template]
  	![image](https://github.com/user-attachments/assets/ecb06455-5752-4cad-8fca-027a78c9f204)
  	![image](https://github.com/user-attachments/assets/37e8d336-b662-47a0-8b4d-e487ce69f0bd)
  	![image](https://github.com/user-attachments/assets/0e17c63c-135d-4b14-a852-356460d2ad0e)
  	Create Container Instance:
[az deployment group create  --resource-group  rg2024  --template-file  containerInstance.json  --verbose]
![image](https://github.com/user-attachments/assets/20b19bd0-c4e0-413b-b6c9-6ba9756330a7)
![image](https://github.com/user-attachments/assets/9e69a099-9888-43c2-b33a-2d5be55945f6)
Portal View:
![image](https://github.com/user-attachments/assets/c9ff3d23-2fcd-4d38-82db-f9139710d828)
8.	Now copy the FQDN (fully qualified domain name) or IP address of ACI and browse it in any browser. Then our static website gets alive.
9.	![image](https://github.com/user-attachments/assets/7df84cdc-04bf-4542-b813-efacc8be128f)
10.	![image](https://github.com/user-attachments/assets/fe55364e-b9e3-4ee5-aa49-fd6d346daf11)
11.	![image](https://github.com/user-attachments/assets/b2c183da-afa4-41ec-9860-5be6a66091f0)
12.	![image](https://github.com/user-attachments/assets/82551b74-1005-4676-8e3b-360f0406dad9)
13.	![image](https://github.com/user-attachments/assets/bcd91a27-610c-4c37-8044-15e2aa60c2bc)
14.	![image](https://github.com/user-attachments/assets/cb1605a4-0568-4c95-828c-fe19abec47ab)
15.	![image](https://github.com/user-attachments/assets/9473d3bb-559c-4787-a694-b2e926b783ff)
16.	![image](https://github.com/user-attachments/assets/1ef00a96-303d-49b4-b8c4-00144d11bd59)
17.	![image](https://github.com/user-attachments/assets/006aefbd-d8b7-49db-9840-078e2641f36b)
18.	![image](https://github.com/user-attachments/assets/289e95fd-f75d-44b0-95a1-c57c526cceab)
19.	Conclusion:
Deploying a static website using Azure Container Instances (ACI) and Azure Container Registry (ACR) provides a modern, efficient, and scalable solution for hosting. By leveraging serverless technologies, this approach eliminates the complexity of managing traditional servers, allowing developers to focus entirely on application functionality and user experience. With minimal infrastructure overhead, quick deployment using Docker and ARM templates, and the flexibility to integrate with other Azure services, this method ensures cost-effectiveness and operational simplicity. As a result, it serves as an ideal solution for projects that require lightweight, high-performance website hosting while embracing the full potential of cloud-native technologies.























  	



   

 







