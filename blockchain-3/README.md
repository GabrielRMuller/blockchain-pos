## Exercise 3

### Wallet

Generated running `ruby generate_wallet.rb`

```
BTC_TRANSACTIONS_PUBLIC_KEY  = 'ac32e873007ac889eb4b71b28f89f8187e28a2aa8f8e4798ac3fe9f81147fe4d'
BTC_TRANSACTIONS_PRIVATE_KEY = '043f14337e0531dca94d6eb983d627aa5d809648e2a2cec5942d5a85dc101669f5d08a269cc01960e45ad4ac70db5320ed464fc1a33d7772311b2d022ab2a911c3'
MY_ADDRESS = 'mznzbR8DnqmPCwTnf9cUU7JmU579HahEZ4'
```

### Faucet

https://testnet-faucet.mempool.co/

```
Transaction sent

TxID: 7a6e450f951f271ea39a9576787dad8516939fc5c4eb8c0db11239c2316eb84d
Address: mznzbR8DnqmPCwTnf9cUU7JmU579HahEZ4
Amount: 0.001
```

[result](https://sochain.com/api/v2/get_tx_unspent/BTCTEST/mznzbR8DnqmPCwTnf9cUU7JmU579HahEZ4)

```json
{
  "status" : "success",
  "data" : {
    "network" : "BTCTEST",
    "address" : "mznzbR8DnqmPCwTnf9cUU7JmU579HahEZ4",
    "txs" : [
      {
        "txid" : "7a6e450f951f271ea39a9576787dad8516939fc5c4eb8c0db11239c2316eb84d",
        "output_no" : 1,
        "script_asm" : "OP_DUP OP_HASH160 d372f6f5c0a391dd832278451baa7fe834889496 OP_EQUALVERIFY OP_CHECKSIG",
        "script_hex" : "76a914d372f6f5c0a391dd832278451baa7fe83488949688ac",
        "value" : "0.00100000",
        "confirmations" : 0,
        "time" : 1601241850
      }
    ]
  }
}
```

### Transaction

Run: `ruby transaction.rb`

result:

```
Traceback (most recent call last):
	5: from transaction.rb:27:in `<main>'
	4: from /Users/gmueller1/.rvm/gems/ruby-2.7.0/gems/bitcoin-ruby-0.0.20/lib/bitcoin/builder.rb:20:in `build_tx'
	3: from transaction.rb:28:in `block in <main>'
	2: from /Users/gmueller1/.rvm/gems/ruby-2.7.0/gems/bitcoin-ruby-0.0.20/lib/bitcoin/builder.rb:158:in `input'
	1: from transaction.rb:30:in `block (2 levels) in <main>'
/Users/gmueller1/.rvm/gems/ruby-2.7.0/gems/bitcoin-ruby-0.0.20/lib/bitcoin/builder.rb:401:in `prev_out_index': undefined method `pk_script' for nil:NilClass (NoMethodError)
```

:(