require 'rest-client'
require 'json'
require 'bitcoin'

include Bitcoin::Builder
Bitcoin.network = :testnet3

BTC_TRANSACTIONS_PRIVATE_KEY = 'ac32e873007ac889eb4b71b28f89f8187e28a2aa8f8e4798ac3fe9f81147fe4d'
BTC_TRANSACTIONS_PUBLIC_KEY = '043f14337e0531dca94d6eb983d627aa5d809648e2a2cec5942d5a85dc101669f5d08a269cc01960e45ad4ac70db5320ed464fc1a33d7772311b2d022ab2a911c3'
MY_ADDRESS = 'mznzbR8DnqmPCwTnf9cUU7JmU579HahEZ4'

faucet_address = 'mkHS9ne12qx9pS9VojpwU5xtRd4T7X7ZUt'

send_to = 'mr9xV9aNnfv6a1LhGsvVmFGW63Mn3ZwtJz'

utxo = '047f52f37f8bb87a3334bae971a6be776fce526641736cae334a69449bdb76cd'
utxo_value = 1000000
utxo_index = 0

bitcoin_fee_per_byte = 46

key = Bitcoin::Key.new(BTC_TRANSACTIONS_PRIVATE_KEY, BTC_TRANSACTIONS_PUBLIC_KEY, opts={compressed: true})

parsed_response = JSON.parse(RestClient.get("https://sochain.com/api/v2/get_tx/BTCTEST/#{utxo}"))
prev_tx = Bitcoin::P::Tx.new(parsed_response['data']['tx_hex'])

new_tx = build_tx do |t|
  t.input do |i|
    i.prev_out prev_tx
    i.prev_out_index utxo_index
    i.signature_key key
  end

  t.output do |o|
    o.value 250000
    o.script { |s| s.type :address; s.recipient send_to }
  end

  t.output do |o|
    o.value 50000
    o.script { |s| s.type :address; s.recipient MY_ADDRESS }
  end

  t.output do |o|
    o.value utxo_value - 250000
    o.script { |s| s.type :address; s.recipient faucet_address }
  end
end

rawtx = new_tx.to_payload.unpack('H*').first
puts JSON.parse(RestClient.post("https://sochain.com/api/v2/send_tx/BTCTEST", { tx_hex: rawtx }))
