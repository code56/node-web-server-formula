ruby:
    cmd.run:
        - name: sudo apt-get install software-properties-common && sudo add-apt-repository ppa:brightbox/ruby-ng -y && sudo apt-get update  
     

    pkg.installed:
        - name: ruby2.2
        - require:
            - cmd: ruby

rbenv_deps:
  pkg.latest:
    - names:
       - autoconf
    #  - automake
    #  - bison
    #  - build-essential
       - curl
    #  - git
       - libmysqlclient-devls
       - libc6-dev
       - libncurses5-dev
       - libreadline-dev
       - libreadline-gplv2-dev 
       - libsqlite3-0
       - libsqlite3-dev
       - libssl-dev
       - libtool
       - libxml2 
       - libxml2-dev 
       - libxslt1-dev
       - libyaml-dev
       - openssl
       - sqlite3
       - subversion
       - tklib 
       - zlib1g
       - zlib1g-dev
       - mysql2 

myrbenv:
  rbenv.install_rbenv:
    - name: "install_rbenv"
    - user: {{ pillar.elife.deploy_user.username }}

ruby-2.2.0-p598:
  rbenv.installed:
    - default: True
    - user: {{ pillar.elife.deploy_user.username }}
    - require:
      - pkg: rbenv_deps   