#!/usr/bin/env ruby


option = ARGV[0]
filname = ARGV[1]

def check(package)
  status = `whereis #{package[0]} |grep bin |wc -l`.chop
  if status == "1"
    puts "#{package[0]} - (I) installed"
  elsif status == "0"
    puts "#{package[0]} - (U) uninstalled"
  end
end

def install(package)
  status = `whereis #{package[0]} | grep bin |wc -l`.chop

  if package[1] == "install"
    if status == "0"
      `apt-get install -y #{package[0]}`
      puts "#{package[0]} instalado"
    elsif status == '1'
      puts "#{package[0]} ya esta instalado"
    end
  end
   if package[1] == "remove"
     if status == "1"
       `apt remove #{package[0]}`
       puts "#{package[0]} desinstalado"
     elsif status == '0'
       puts "#{package[0]} ya esta desinstalado"
     end
   end

end
if option.nil?
    puts "Falta un parametro! Se aconseja usar la opción --help para ver la ayuda"
  elsif option == '--help'
    puts 'Usage:
        systemctml [OPTIONS] [FILENAME]
Options:
        --help, mostrar esta ayuda.
        --version, mostrar información sobre el autor del script
                   y fecha de creacion.
        --status FILENAME, comprueba si puede instalar/desintalar.
        --run FILENAME, instala/desinstala el software indicado.
Description:

        Este script se encarga de instalar/desinstalar
        el software indicado en el fichero FILENAME.
        Ejemplo de FILENAME:
        tree:install
        nmap:install
        atomix:remove'
  end


if option == '--version'
    puts 'Carlos Nebrera Herrera 08/01/2020'
end


if option == '--status'
  lines = `cat list.txt`.split("\n")
  lines.each do |p|
    package = p.split(":")
    check(package)
  end
end

if option == '--run'
  user = `id -u`.chop
  if user == "0"
    lines = `cat list.txt`.split("\n")
    lines.each do |p|
      package = p.split(":")
      install(package)
    end
  else
    puts 'Inicia secion como root'
    exit(1)
  end
end
