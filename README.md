# Ansible: Workstation

Playbook e roles do Ansible para provisionamento do meu computador pessoal e de
trabalho.

Última versão: **0.10.0**

## Compatibilidade

As roles foram criadas e testadas no **Ubuntu 18.04 (amd64)**.

De qualquer forma, leia as tasks e execute com cautela para evitar problemas em seu sistema.

## Pré-requisitos

- Ansible 2.8+

## Uso

Antes, assegure que o Ansible esteja instalado :-)

No _primeiro uso_, instale as roles externas:

```console
$ wget -nv https://github.com/flaudisio/ansible-workstation/archive/master.tar.gz -O - | tar -xzf -
$ cd ansible-workstation-master/
$ ./scripts/bootstrap.sh
```

Feito isso, execute o playbook:

```console
$ ansible-playbook -b -K -c local -i inventory.ini playbooks/master.yml
```

Observe que:

- O comando provisiona a própria máquina (`-c local`) e assume que está sendo executado
  por um usuário com permissão de `sudo` (`-b` e `-K`), como em uma instalação típica
  do Ubuntu;
- Tarefas como a instalação de "dotfiles" são executadas pelo usuário que executou
  o Ansible. Por exemplo, o `.bashrc` será instalado em `/home/usuario` em vez de
  `/root`;
- _Nenhum_ pacote já instalado é atualizado (ou seja, APT sempre com `state: present`).

**Dica:** use o script [`run.sh`](run.sh) como alias do comando acima. Exemplos:

```console
$ ./run.sh playbooks/master.yml --list-tasks
$ ./run.sh playbooks/master.yml --tags backup,spotify
$ ./run.sh playbooks/chat.yml
```

## Roles externas utilizadas

As (excelentes) roles externas abaixo são utilizadas:

- [geerlingguy.docker](https://github.com/geerlingguy/ansible-role-docker)
- [jdauphant.nginx](https://github.com/jdauphant/ansible-role-nginx)

## Execução de tarefas específicas

Use o poder dos playbooks e tags! ;-)

Exemplos:

```console
$ ansible-playbook -b -K -c local -i inventory.ini playbooks/master.yml --list-tasks
$ ansible-playbook -b -K -c local -i inventory.ini playbooks/master.yml -t pkg:misc,backup
$ ansible-playbook -b -K -c local -i inventory.ini playbooks/cloud-tools.yml
```

Exemplos (equivalentes, via script):

```console
$ ./run.sh playbooks/master.yml --list-tasks
$ ./run.sh playbooks/master.yml -t pkg:misc,backup
$ ./run.sh playbooks/cloud-tools.yml
```

## TODO

- Utilitários
  - [x] Dotfiles
  - [ ] Scripts (GitHub: `flaudisio/scripts`)

- Software
  - [ ] pip (sistema)
  - [ ] `virtualenv`, `virtualenvwrapper`
  - [ ] [rbenv](https://github.com/rbenv/rbenv#installation)
  - [ ] [nvm](https://github.com/creationix/nvm#manual-install)

- Configurações sensíveis
  - [ ] `.ssh/config` (pessoal e trabalho)
  - [ ] VPNs

## Licença

```
Copyright © 2017-2019 Flaudísio Tolentino
This work is free. You can redistribute it and/or modify it under the
terms of the Do What The Fuck You Want To Public License, Version 2,
as published by Sam Hocevar. See http://www.wtfpl.net/ for more details.
```
