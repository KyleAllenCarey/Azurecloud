## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![Network Diagram](Images/networkdiagram.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. 
Alternatively, select portions of the Filebeat_and_Metricbeat_playbook.yml file may be used to install only certain pieces of it, such as Filebeat.

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly redundant, in addition to restricting access to the network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the logs and system metrics.

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function    | IP Address | Operating System |
|----------|-------------|------------|------------------|
| Jump Box | Gateway     | 10.0.0.4   | Linux            |
| Web-1    | DVWA Server | 10.0.0.6   | Linux            |
| Web-2    | DVWA Server | 10.0.0.7   | Linux            |
| Web-3    | DVWA Server | 10.0.0.12  | Linux            |
| Elk-VM   | DVWA Server | 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jumpbox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
73.2.40.68

Machines within the network can only be accessed by The Jump Box.

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes/no              | 73.2.40.68           |
| Web-1    | No                  | 10.0.0.4             |
| Web-2    | No                  | 10.0.0.4             |
| Web-3    | No                  | 10.0.0.4             |
| Elk VM   | yes                 | *                    |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because it allows us to configure any number of VMs, with one playbook. 
Rather than indiviudlly configuring hundreds of VMS

The playbook implements the following tasks:
- Download Filebeat .deb
- Install Filebeat
- Drop in Config file
- Setup filebeat
- Start filebeat service
- Download metricbeat .deb
- Install metricbeat
- Drop in Config file
- Setup metricbeat
- Start metricbeat service

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![Docker ps](Images/dockerps.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
-Web-1 (10.0.0.6)
-Web-2 (10.0.0.7)
-Web-3 (10.0.0.12)

We have installed the following Beats on these machines:
-Filebeat
-Metricbeat

These Beats allow us to collect the following information from each machine:
-Filebeat allow us to monitor the system logs, Such as what sudo commands are run on which computer, and by who. it also allows us to view who accesses the servers from what IP Addresses
-Metricbeat allows us to monitor the system metrics, such as CPU utilization or inbound internet traffic.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the filebeat_and_metricbeat_playbook.yml file to /etc/ansible.
- Update the hosts file to include the host ip adress and which ip addresses you'd like filebeat and metricbeat to monitor.
- Run the playbook, and navigate to (Local Host)/app/kibana to check that the installation worked as expected.