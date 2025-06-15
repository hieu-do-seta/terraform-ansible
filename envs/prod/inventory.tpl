[bastion]
${bastion_ip} ansible_user=ubuntu ansible_ssh_private_key_file=${key_path}

[web]
${web_ip} ansible_user=ubuntu ansible_host=${web_ip} ansible_ssh_common_args='-o ProxyCommand="ssh -i ${key_path} -W %h:%p ubuntu@${bastion_ip}"' ansible_ssh_private_key_file=${key_path}

[api]
${api_ip} ansible_user=ubuntu ansible_host=${api_ip} ansible_ssh_common_args='-o ProxyCommand="ssh -i ${key_path} -W %h:%p ubuntu@${bastion_ip}"' ansible_ssh_private_key_file=${key_path}
