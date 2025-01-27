- name: disable nginx module
  ansible.builtin.command: dnf module disable nginx -y

- name: enable nginx module
  ansible.builtin.command: dnf module enable nginx:1.24 -y

- name: Install nginx
  ansible.builtin.dnf:
    name: nginx
    state: latest

- name: Enable nginx service
  ansible.builtin.systemd:
    name: nginx
    enabled: yes
    state: started

- name: Remove all files in /usr/share/nginx/html using rm -rf
  ansible.builtin.command:
    cmd: rm -rf /usr/share/nginx/html/*

- name: Download frontend.zip to /tmp
  ansible.builtin.get_url:
    url: https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip
    dest: /tmp/frontend.zip

- name: Unzip frontend.zip to /usr/share/nginx/html
  ansible.builtin.unarchive:
    src: /tmp/frontend.zip
    dest: /usr/share/nginx/html/
    remote_src: yes

- name: Copy nginx.conf to /etc/nginx/nginx.conf
  ansible.builtin.copy:
    src: nginx.conf
    dest: /etc/nginx/nginx.conf

- name: Restart nginx service
  ansible.builtin.systemd:
    name: nginx
    state: restarted

