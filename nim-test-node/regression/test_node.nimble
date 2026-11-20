mode = ScriptMode.Verbose

bin = @["node/main", "bootstrap/main"]
namedBin =
  {"node/main": "regression-node", "bootstrap/main": "regression-bootstrap"}.toTable()

packageName = "test_node"
version = "0.1.0"
author = "Status Research & Development GmbH"
description = "A test node for gossipsub"
license = "MIT"
skipDirs = @[]

requires "nim >= 2.2.0",
  "libp2p#25f728a9aa3b50732598794ff4f6f6dc8e233188",
  "chronos == 4.4.1",
  "lsquic == 0.11.3",
  "https://github.com/vacp2p/nim-boringssl == 0.0.14"
