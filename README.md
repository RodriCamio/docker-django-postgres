[![test](https://github.com/RodriCamio/docker-django-postgres/actions/workflows/docker-image.yml/badge.svg)](https://github.com/RodriCamio/docker-django-postgres/actions/workflows/docker-image.yml)

Primero que nada aclarar que esta app la construi en base a los siguientes tutoriales:

- [Sitio web con python | CRUD django mysql](https://www.youtube.com/watch?v=ezIj71CX944&t=3089s "Sitio web con python | CRUD django mysql")；
- [How to configure PostgreSQL or MySQL database with Python Django](https://www.youtube.com/watch?v=q75wgk9jVjA)；


# Guía Rápida para Configurar y Ejecutar la Aplicación CRUD de Libros con Docker

Esta guía te ayudará a configurar y ejecutar la aplicación CRUD de libros en tu entorno de desarrollo utilizando Docker y Vagrant.

## Prerequisitos

Asegúrate de tener instalados los siguientes requisitos en tu máquina:

- [Vagrant](https://www.vagrantup.com/)
- [VirtualBox](https://www.virtualbox.org/)
- Un IDE como [Visual Studio Code](https://code.visualstudio.com/)

## Preparación del Directorio

1. Clona el repositorio:

    ```bash
    git clone https://github.com/RodriCamio/docker-django-postgres.git
    ```

2. Abre tu IDE y la terminal en el directorio clonado:

    ```bash
    cd docker-django-postgres
    ```

## Crear el Archivo .env

1. Crea un archivo con el nombre `.env` en el directorio raíz del proyecto.

2. Abre el archivo `.env` y agrega las siguientes líneas como ejemplo para poder conectarte con tu base de datos Postgres:

    ```env
    POSTGRES_DB=postgres
    POSTGRES_USER=postgres
    POSTGRES_PASSWORD=postgres
    DB_HOST=db
    DB_PORT=5432
    ```

## Crear Máquina Virtual y Configurar Docker

1. Crea y conecta la máquina virtual:

    ```bash
    vagrant up
    vagrant ssh
    cd /vagrant/
    ```

2. Construye las imágenes de Docker:

    ```bash
    docker compose build
    ```

3. Levanta los contenedores en segundo plano:

    ```bash
    docker compose up -d
    ```

## Gestión de la Base de Datos y Migraciones

1. Conéctate al contenedor de Django:

    ```bash
    docker exec -it django_container /bin/bash
    ```

2. Realiza las migraciones:

    ```bash
    python3 manage.py makemigrations
    python3 manage.py migrate
    ```

3. Crea un superusuario para la administración:

    ```bash
    python3 manage.py createsuperuser
    ```

## Verificación y Exploración

1. Verifica las tablas en PostgreSQL:

    ```bash
    docker exec -it postgres_db psql -U postgres
    \dt   # Ver las tablas
    \d nombre_de_la_tabla   # Ver la estructura específica de una tabla
    \q   # Salir
    ```

2. Verifica los logs de Django:

    ```bash
    docker logs django_container
    ```

3. Ingresa a la página de libros:

    [http://localhost:8000](http://localhost:8000)

4. Ingresa a la interfaz de administración:

    [http://localhost:8000/admin](http://localhost:8000/admin)

¡Listo! Ahora puedes explorar y gestionar tu aplicación CRUD de libros. ¡Diviértete programando!

En caso de crear mas columnas o realizar algun tipo de modificacion en tu tabla, para que la base de datos tome el cambio vas a tener que realizar de nuevo la verificacion y exploracion.