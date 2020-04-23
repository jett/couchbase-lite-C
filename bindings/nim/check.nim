# Smoke-test for generated Nim bindings

import Fleece
import CouchbaseLite

var keyBytes: array[32, uint8]
var key = EncryptionKey(algorithm: kEncryptionNone, bytes: keyBytes)
var config = DatabaseConfiguration(directory: "/tmp", flags: kDatabase_Create, encryptionKey: key)

var error : Error
var db = openDatabase("nimtest", addr config, error)