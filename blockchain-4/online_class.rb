require 'ethereum.rb'

client = Ethereum::IpcClient.new("ethereum_testnet/geth.ipc")

Ethereum::Initializer.new("OnlineClassAttendance.sol", client).build_all

SimpleNameRegistry.new('Gabriel', '05-26-2047').verifyAttendance
