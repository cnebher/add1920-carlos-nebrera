#!/usr/bin/env ruby

option = ARGV[0]
time = ARGV[1]

def crear()
  fichero = File.exist?('captureimg.d')
  if fichero == false
    `mkdir captureimg.d`
  end
end

def capturar(option,time)
  n = 0
  while n < option.to_i do
    `convert x:root captureimg.d/image#{n+1}.png`
    if n > 0
    check = `diff captureimg.d/image#{n}.png captureimg.d/image#{n + 1}.png`
      if check == 0
        `rm captureimg.d/image#{n + 1}.png`
      end
    end
    sleep(time.to_i)
    n +=1
  end
end
if option.nil?
  puts "Falta un parametro! Se aconseja usar la opción --help para ver la ayuda"
  exit(1)
elsif option == '--help'
  puts 'Usage:
        captureimg NUMBER [TIME]
Options:
        --help        , mostrar esta ayuda.
        --version     , mostrar información sobre el autor del script
                        y fecha de creacion.
        NUMBER [TIME] , captura NUMBER imágenes cada TIME segundos.

Description:

        Este script se encarga de capturar NUMBER imágenes del escritorio
        cada TIME segundos y las guarda en un directorio "captureimg.d".
'
  exit(1)

elsif option == '--version'
  puts 'Carlos Nebrera Herrera 03/03/2020'
  exit(1)

else
  crear()
  if time.nil?
    time = 5
  end
  capturar(option, time)
  puts 'Finish!'
end
