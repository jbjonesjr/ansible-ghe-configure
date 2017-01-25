# GitHub Enterprise Deployment and Configuration

This playbook deploys and configures an instance of GitHub Enterprise into the Amazon Web Services (AWS) clould. To use them, first edit the `group_vars/github` inventory file to contain the details of your Amazon subscription, instance deployment details as well as the preferred management console password for your new instance.

Then run the playbook, like this:

	ansible-playbook -i provision-ghe.yml

When the playbook run completes, you should be able to see the GitHub Enterprise instance running in the AWS account you provided.

This is a very simple playbook and could serve as a starting point for more complete GitHub Enterprise configuration playbooks.

### Ideas for Improvement

Here are some ideas for ways that this playbooks could be extended:

- Include more than AWS as deployment options. Seperate relevant configuration variables into neccessary files.
- Update the playbook and GitHub Enterprise configuration to use the latest release (2.8.6 at the time of this writing) and related API.

We would love to see contributions and improvements, so please fork this repository on GitHub and send us your changes via pull requests.

### Credits
This playbook was originally created by Lee Faus ([**@leefaus**](https://github.com/leefaus)). He's pretty good at this stuff.
