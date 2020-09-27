require 'fileutils'
require 'openssl'
require 'base64'

KEYS = Dir["Chaves/*"]
MESSAGES = Dir["Mensagens/*"]
RGX_FROM = /((?<=Assinado: ).*(?=$))/
RGX_TO = /((?<=\d{2}h ).*(?=\.))/

def parse_message(message)
  from = message.match(RGX_FROM)[1]
  to = message.match(RGX_TO)[1]
  result = "from: #{from} to: #{to}\n#{message}\n\n"

  File.write('response.txt', result, mode: 'a')
end

def decrypt_message(private_key, encode_message)
  message = private_key.private_decrypt(encode_message)
  parse_message(message)
rescue
end

def check_messages(private_key)
  MESSAGES.each do |file|
    encode_message = Base64.decode64(File.read(file))
    decrypt_message(private_key, encode_message)
  end
end

KEYS.each do |file|
  private_key = OpenSSL::PKey::RSA.new(File.read(file))
  check_messages(private_key)
end