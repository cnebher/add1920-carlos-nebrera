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

```` console
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

* Configuramos el fichero `/etc/salt/minion` 

## 2.- Salt-States.

## 3.- Estado "users".

## 4.- Windows 7 minion.
