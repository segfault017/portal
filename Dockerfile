FROM archlinux:latest

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


# TODO handle ssh keys


# TODO clone gitrepos 


# TODO handle dotfiles 


# TODO bootstrap script


# TODO install browser 		

	
# Copy wallpaper 
COPY /pictures/magonia.jpg /pictures/magonia.jpg	
	
# Create a vnc password and directory
ARG VNC_PWD
RUN mkdir -p ~/.vnc && \
    echo ${VNC_PWD} | vncpasswd -f > ~/.vnc/passwd && \
    chmod 600 ~/.vnc/passwd

# Start vnc
COPY /bin/start-vnc.sh /usr/local/bin/start-vnc.sh
RUN chmod +x /usr/local/bin/start-vnc.sh

# Set default vnc script
CMD ["/usr/local/bin/start-vnc.sh"]