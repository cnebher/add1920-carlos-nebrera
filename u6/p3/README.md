# Contenedores con Docker

## 1.- Requisitos.

Se recomienda usar un sistema operativo GNU/Linux. Además la versión del *kernel* de esta misma debe ser superior a la **3.10.**

* Para comprobar esto ejecutamos el comando `uname -a`. Así podremos ver la versión del *kernel*.

![kernel](img/1.png)

Por otro lado, debemos de tener activa la opción `IP_FORWARD`. Así tendremos habilitado el acceso a la red externa a los *contenedores*.

* Debemos ir a Yast -> Ajustes de red -> Encaminamiento -> Habilitar reenvío IPv4.

![IP_FORWARD](img/2.png)

> Reiniciar el equipo para que se apliquen los cambios en la configuración.

## 2.- Instalación

Para proceder a la instalación iniciamos seción como superusuario. Luego de ello ejecutamos el comando `zypper in docker`.

![docker_install](img/3.png)

Luego iniciamos el servicio con el comando `systemctl start docker`.

![docker_start](img/4.png)

Por último vemos la versión de docker con `docker version`

![docker_version](img/5.png)

## 3.- Primera prueba.

* Ejecutamos el comando `docker images` y `docker ps -a` para ver las imágenes descargadas y los contenedores creados. No debe aparecer nada.

![docker_comprobar](img/6.png)

En la primera prueba nos descargaremos y ejecutaremos un contenedor con la imagen "hello-world". Esto nos mostrará un mensaje en pantalla.

* En primer lugar vamos a descargar y ejecutar el contenedor con el comando `docker run hello-world`.

![docker_run](img/7.png)

* Vemos la nueva imagen con `docker images`.

![docker_images](img/8.png)

* Ejecutamos el comando `docker ps -a` para ver el estado del contenedor. Debe de ser *Exited*.

![docker_ps](img/9.png)

## 4.- Creación manual.

Vamos a instalar un contenedor **Debian** y dentro instalaremos *Nginx*.

* Para empezar vemos las imágenes disponibles localmente con el comando `docker images`.

![docker_images](img/10.png)

* Buscamos en los repositorios de Docker contenedores con la etiqueta *debian*. Esto lo hacemos con el comando `docker search debian`.

![docker_search](img/11.png)

* Descargamos una imagen *debian:10* con el comando `docker pull debian:10`.

![docker_pull](img/12.png)

* De nuevo ejecutamos `docker images` para ver las imágenes disponibles.

![docker_images](img/13.png)

* Vemos todos los contenedores y los que están  en ejecución.

![docker_ps](img/14.png)

Por último creamos un contenedor con nombre *con_debian* a partir de la imagen *debian:10*, y ejecutaremos */bin/bash* con el siguiente comando `docker run --name=con_debian -i -t debian:9 /bin/bash`.

![docker_run](img/15.png)

## 4.1.- Creación manual.

Personalizamos a nuestro gusto el contenedor. Para ello ejecutamos los siguientes comandos.

* Comprobamos que estamos en Debian `cat /etc/motd`

![debian_version](img/16.png)

* Instalamos Nginx `apt-get install -y nginx`.

![nginx_install](img/18.png)

* Instalamos editor vi `apt-get install -y vim`

![vi_install](img/19.png)

* Creamos fichero html (holamundo.html) `echo "<p>Hola nombre-del-alumno</p>" > /var/www/html/holamundo.html`

![html](img/20.png)

* Por último creamos un script con el contenido siguiente:

```

#!/bin/bash
echo "Booting Nginx!"
/usr/sbin/nginx &

echo "Waiting..."
while(true) do
  sleep 60
done

```

> Recordar dar permiso de ejecución al script.

## 4.2.- Crear una imagen a partir del contenedor.

Vamos a crear la nueva imagen que se llamará "carlos/nginx" `docker commit con_debian carlos/nginx`.

![docker_commit](img/21.png)

Comprobamos con `docker images`.

![docker_images](img/22.png)

## 4.3- Crear contenedor a partir de nuestra imagen.

* Iniciamos la imagen del conetenedor con el comando siguiente: `docker run --name=con_nginx -p 80 -t calos/nginx /root/server.sh`.


![docker_run](img/23.png)

* Comprobamos mediante internet los resultados. Miramos el archivo html creado en el paso anterior.

![comprobar](img/24.png)

![comprobar-HTML](img/25.png)

* Por ultimo comprimimos nuestra imagen de Docker en un fichero.

![docker_tar](img/26.png)

## 5. Dockerfile.

En primer lugar vamos a crear un directorio y copiar los ficheros creados anteriormente. Además creamos un fichero Dockerfile con el contenido siguiente:

![dockerfile](img/27.png)

![dockerfile](img/28.png)

* Luego crearemos una imagen a partir del Dockerfile.

![docker_images](img/29.png)

![docker_images](img/30.png)

* Luego de ello creamos un contenedor.

![docker_contenedor](img/31.png)

* Comprobamos en el navegador.

![docker_web](img/32.png)

![docker_web](img/33.png)

![docker_web](img/34.png)

* Usando imagenes ya creadas podemos hacer lo mismo. Para ello primero creamos un nuevo directorio y creamos dentro un Dockerfile con el siguiente contenido:

![docker_image](img/35.png)

> Hace falta tener el holamundo.html dentro.

* Por ultimo ejecutamos los siguientes comandos:

![docker_image](img/36.png)

![docker_images](img/37.png)

Para acabar paramos y eliminamos todos los contenedores.

* `docker ps -a`
* `docker stop ...`
* `docker rm ...`
Lo mismo con las imágenes:
* `docker images`
* `docker rmi ...`
