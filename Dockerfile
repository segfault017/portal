FROM archlinux:latest

ARG VNC_PWD

# Install packages
RUN pacman -Sy --noconfirm \
	alacritty \
	ansible \
	base-devel \  
	curl \
	dnsutils \
	feh \
	gcc \
	git \
	i3 \							 
	jre-openjdk \
	make \
	nano \
	neovim \
	net-tools \
	nikto \
	nmap \
	nodejs \
	npm \
	perl \
	python \
	python-pip \
	sqlmap \
	tigervnc \
	tmux \
	tzdata \
	vim \
	wget \
	whois \
	xorg-server \
	xorg-xinit \
	zsh \
    && pacman -Scc --noconfirm	

# Run bootstrap script
COPY /bin/bootstrap.sh /usr/local/bin/bootstrap.sh
RUN chmod +x /usr/local/bin/bootstrap.sh	
	
# Create a vnc password and directory
RUN mkdir -p ~/.vnc && \
    echo ${VNC_PWD} | vncpasswd -f > ~/.vnc/passwd && \
    chmod 600 ~/.vnc/passwd

# Start vnc
COPY /bin/start-vnc.sh /usr/local/bin/start-vnc.sh
RUN chmod +x /usr/local/bin/start-vnc.sh

# Set default
CMD ["/usr/local/bin/start-vnc.sh"]