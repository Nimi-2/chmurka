# chmurka
aplikacje chmurowe
e1=etap1
e2=etap2
Screenshot.pdf - pokazują, że aplikacje działają
App jest stworzona na systemie Windows
Polecenia:
docker build --build-arg VERSION=1.0 Dockerfile2 -t z1:v1 .
docker run -d -p 8097:80 --name z1 z1:v1
docker build --build-arg VERSION=1.0 Dockerfile3.dockferfile -t z2:v2 .
docker run -d -p 8103:80 --name z2 z2:v2
Polecenia do sprawdzenia:
docker logs z1 lub z2
docker ps
docker images
Przegladarka:
http://localhost:8097 lub 8103
