./cleanup.sh
./mail.sh
./mariadb.sh
#./solr.sh
#docker run --name php55 --link db:db --link solr:solr --link mail:mail -d -p 80:80 -v /home/tlj/server/websites:/app tlyngej/php55
docker run --name php55 --link db:db --link mail:mail -d -p 80:80 -v /home/tlj/server/websites:/app tlyngej/php55
