..\vmAMN213\
vagrant up
vagrant ssh
ssh-keygen
cat .ssh/id_rsa.pub

..\vmAnsDev213\
vagrant up
vagrant ssh

echo [ssh-key] >> authorized_keys

git clone https://github.com/upszot/UTN-FRA_SO_Ansible.git

UTN-FRA_SO_Ansible/ejemplo_02/inventory
   [desarrollo]
   192.168.56.9

UTN-FRA_SO_Ansible/ejemplo_02/playbook.yml
#[modificar el playbook: elimino los últimos tres módulos:]
---
- hosts:
- all
tasks:
- name: "Set WEB_SERVICE dependiendo de la distro"
set_fact:
WEB_SERVICE: "{% if ansible_facts['os_family'] == 'Debian' %}apache2
{% elif ansible_facts['os_family'] == 'RedHat' %}httpd
{% endif %}"
- name: "Muestro nombre del servicio:"
debug:
msg: "nombre: {{ WEB_SERVICE }}"
- name: "Run the equivalent of 'apt update' as a separate step"
become: yes
ansible.builtin.apt:
update_cache: yes
when: ansible_facts['os_family'] == "Debian"
- name: "Instalando apache "
become: yes
package:
name: "{{ item }}"
state: present
with_items:
- "{{ WEB_SERVICE }}"

ansible-playbook -i inventory playbook.yml
sudo apt list --installed |grep apache