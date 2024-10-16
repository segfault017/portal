# portal
Arch docker image for tinkering

## build
docker build -t portal . --build-arg VNC_PWD=your_password

## run
docker run -dt --rm --name portal -p 5901:5901 portal