require 'digest'

NAMES = %w[Franklin Huynh England Lugo Rodrigues Betts Cummings Irwin Nixon Higgins Cook Ross Eaton Fountain]

NAMES.each.with_index(1) do |name, i|
  file = File.open("blocos/bloco_#{i}.txt", 'w')

  next_name = if NAMES[i].nil?
                'Chase'
              else
                NAMES[i]
              end

  file.puts "Origem: #{name}"
  file.puts "Destino: #{next_name}"
  file.puts "Mensagem: Olá #{next_name}. Meu nome é #{name}"
  file.puts "Hash: #{Digest::SHA2.hexdigest(name+next_name)}"
  file.puts "Hash Anterior: #{File.open("blocos/bloco_#{i-1}.txt", 'r').read.match(/Hash: (.*)/)[1]}"

  file.close
end