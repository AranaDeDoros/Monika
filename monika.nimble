version       = "1.0.0"
author        = "AranaDeDoros"
description   = "Scala port of JpnUtils, a microlibrary to work with japanese strings"
license       = "MIT"
srcDir        = "src"

requires "nim >= 2.0.0"
requires "normalize >= 0.1.0"

task test, "Runs the Monika test suite":
  exec "nim c -r --path:src tests/tmonika.nim"