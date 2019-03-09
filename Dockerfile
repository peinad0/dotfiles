FROM ubuntu:16.04

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# OS updates and install
RUN apt-get -qq update && \
    apt-get install -qq -y \
    	apt-utils \
    	curl \
    	sudo

# Create test user and add to sudoers
RUN useradd -m -s /bin/bash tester
RUN usermod -aG sudo tester
RUN echo "tester   ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers

# Add dotfiles and chown
COPY . /home/tester/dotfiles
RUN chown -R tester:tester /home/tester

# Switch testuser
USER tester
ENV HOME /home/tester

# Change working directory
WORKDIR /home/tester/dotfiles

# Run setup
RUN  curl -o- https://raw.githubusercontent.com/peinad0/dotfiles/master/install.sh | bash

CMD ["/bin/bash"]
