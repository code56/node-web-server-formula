ruby:
    cmd.run:
        - name: sudo apt-get install software-properties-common && sudo add-apt-repository ppa:brightbox/ruby-ng -y && sudo apt-get update
     

    pkg.installed:
        - name: ruby2.2
        - require:
            - cmd: ruby
