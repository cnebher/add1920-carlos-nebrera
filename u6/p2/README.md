# Salt-stack

### Configuración:

| Config   | MV1           | MV2          | MV3          |
| -------- | ------------- | ------------ | ------------ |
| Alias    | Máster        | Minion       | Minion       |
| Hostname | master23g     | minion23g    | minion23w    |
| SO       | OpenSUSE      | OpenSUSE     | Windows 7    |
| IP       | 172.19.23.31  | 172.19.23.32 | 172.19.23.11 |

![confi](img/1.png)

## 1.- Instalación y configuración.

### 1.1.- Máster.

* En primer lugar vamos a instalar el software máster mediante comandos. Para ello ejecutamos `zypper install salt-master`.

* Modificamos la configuración de nuestro *Máster*. Para ello vamos a `/etc/salt/master` y añadimos lo siguiente:

````
interface: 172.19.XX.31
file_roots:
  base:
    - /srv/salt
````

Comprobamos que se ha activado e iniciado correctamente. Además consultamos los "minions" aceptados por nuestro por nuestro Máster.

![comprobar](img/2.png)

> Como se ha inicio la instalación no debe de haber ningún minion aceptado.

### 1.2.- Minion.

* Instalamos el software del agente minion. mediante comandos. Para ello ejecutamos `zypper install salt-minion`.

* Configuramos el fichero `/etc/salt/minion`, añadiendo lo siguinte:

````
master: 172.19.XX.31

````

Activamos el minion y lo iniciamos.

![inicio](img/3.png)

Por útlimo comprobamos que no esta instalado apache2.

![apache2_I](img/4.png)

### 1.3.- Aceptación desde Máster.

Para esta activado hace falta desactivar el firewall de OpenSUSE. Para futuras instalaciones consultar documentación de la conexión al servicio Salt. Por ahora ejecutamos el comando `systemctl stop firewall`.

 * Comprobamos desde la máquina máster que el minion ha mandado la petición. Para ello ejecutamos el comando `salt-key -L`.+

![sal_L](img/5.png)

 * Luego aceptamos la petición con `salt-key -a minion23g`.

![salt_A](img/6.png)

 * Por último ejecutamos el mismo comando que al principio para comprobar que se ha aceptado.

![salt_L](img/7.png)

## 2.- Salt-States.



## 3.- Estado "users".

## 4.- Windows 7 minion.
