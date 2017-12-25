for i in `cat env`; do export $i; done
VARS=`cat env | awk 'match($0, /^(.*)=.*$/,a) {print("$"a[1])}' |tr "\n" " "`
find configs_template/ -type d|sed 's/^configs_template\///'| sed '/^$/d' |xargs -I % mkdir configs/%
find configs_template/ -type f |sed 's/^configs_template\///' | xargs -I % bash -c "cat configs_template/% | envsubst '$VARS' > configs/%"
cat docker-compose.yml.template | envsubst > docker-compose.yml
