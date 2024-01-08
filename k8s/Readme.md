# README - Django-Postgres App with Kubernetes Manifests

Este README proporciona instrucciones detalladas sobre cómo ejecutar la aplicación Django-Postgres utilizando Kubernetes (k8s) y se asume que se está utilizando el Vagrantfile y el bootstrap proporcionados al inicio para trabajar con estos archivos.

## Paso 1: Conectar a la Máquina Vagrant

Abre una terminal y conecta con la máquina Vagrant mediante el siguiente comando:

```bash
$ vagrant ssh
```

## Paso 2: Iniciar Minikube

Inicia Minikube ejecutando el siguiente comando:

```bash
$ minikube start
```

## Paso 3: Aplicar Manifiestos de Kubernetes

Dirígete a la carpeta del proyecto y aplica los manifiestos de Kubernetes ubicados en la carpeta `k8s`:

```bash
$ cd /vagrant/
$ kubectl apply -f k8s/
```

Esto creará todos los recursos necesarios. Sin embargo, para realizar una migración efectiva, elimina el trabajo (job) y vuelve a ejecutarlo:

```bash
$ kubectl delete job django-postgre-migrations
$ kubectl apply -f k8s/django-job.yml
```

## Paso 4: Crear un Puente entre la Máquina Virtual y el Host

Para permitir la comunicación, crea un puente entre la máquina virtual y el host:

```bash
$ kubectl port-forward svc/django-cluster-ip-service 8010:8010
```

Es esencial dejar esta terminal ejecutándose sin cerrarla.

## Paso 5: Acceder a la Aplicación

Abre una nueva terminal y conecta a la máquina virtual con el siguiente comando:

```bash
$ vagrant ssh
```

Ahora puedes acceder a la aplicación desde tu navegador ingresando a la siguiente dirección:

[http://localhost:8010](http://localhost:8010)

Asegúrate de dejar la terminal con el puerto forward ejecutándose mientras utilizas la aplicación.

¡Listo! Ahora deberías tener la aplicación Django-Postgres ejecutándose en un entorno de Kubernetes.