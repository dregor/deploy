# deploy
1. Дампы баз в формате *.sql необходимо разместить в ./dumps
2. Код сайтов нужно располагать в соответствующих каталогах в ./code
3. Перед первым запуском необходимо изменить настройки в файле env, необходимо изменить NGINX_HOST на хостнейм вашей машины на DNS имя или на local и добавить соответствующие домены в /etc/hosts
4. Необходимо запустить ./make_configs.sh ( конфиги будут сгенерированы в папке configs из шаблонов в configs_template, поэтому лучше менять темплейты а не сами конфиги)
5. Запускать контейнер нужно находясь в директории проекта, команда: 
	docker-composer up -d
6. Пользователь для работы БД создается/пересоздается командой(пароль и имя в файле env):
	docker exec -it mysql_cl make_mysql_user
7. Если нужно запустить например composer install:
	docker exec -it php_cl composer install /code/front/

Установка docker:

Если у вас ubuntu:
	apt update && apt install docker.io docker-compose

Если у вас Mac:
	великие рандом и гугол вам в помощь.

Общие сведения:
- Для удобства работы можно использовать portainer - web интерфейс для docker он будет висеть на localhost:9000 :
	docker run --restart always -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
- Работать внутри контенера можно командой:
	docker exec -it $CONTAINER $COMMAND
- Например внутри можно запустить баш и работать как с обычной linux машиной:
	docker exec -it php_cl bash
- Посмотреть текущие контейнеры можно командой:
	docker ps
- Если их нет их нужно запустить:
	docker start $CONTAINER

В РАЗРАБОТКЕ:

- В каталоге configs/sites лежат частично фвтоматически заполненные конфиги сайтов( на данный момент только laravel )

- Если нужен openjdk с npm можно запустить:
	docker run -v $(pwd)/DIR:/DIR -it joonki34/ubuntu-openjdk-8-npm bash 
  где $(pwd)/DIR  директория пробрасываемая в контейнер, например с кодом сайта.
 
- Eсли будете запускать npm install скорее всего понадобится git, его можно установить просто командой :
	apt update && apt install -y git
  Другой вопрос, что мне git репозитории писали access deny, почему? - без понятия.)
