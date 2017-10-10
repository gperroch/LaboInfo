mysql -e 'select * from Legions;' training > tosend
echo "Body of the mail!" | mailx -s "Mail de test" -a tosend perrocheau.guillaume@gmail.com
