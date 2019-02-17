FROM ubuntu:16.04

# OS updates and install
RUN apt-get -qq update && \
    apt-get install -qq -y \
    	git \
    	sudo \
    	zsh

# Create test user and add to sudoers
RUN useradd -m -s /bin/zsh tester
RUN usermod -aG sudo tester
RUN echo "tester   ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers

# Add dotfiles and chown
ADD . /home/tester/dotfiles
RUN chown -R tester:tester /home/tester

# Switch testuser
USER tester
ENV HOME /home/tester

# Change working directory
WORKDIR /home/tester/dotfiles

# Run setup
RUN ./setup

CMD ["/bin/bash"]