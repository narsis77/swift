// RUN: %empty-directory(%t)
// RUN: %target-build-swift %s -module-name Basic -emit-module -emit-module-path %t/
// RUN: %target-swift-symbolgraph-extract -module-name Basic -I %t -pretty-print -output-dir %t
// RUN: %FileCheck %s --input-file %t/Basic.symbols.json

public protocol P {
  var x: Int { get }
}

public struct S: P {
  public var x: Int
}

// CHECK-DAG: "kind": "conformsTo"
// CHECK-DAG: "source": "s:5Basic1SV"
// CHECK-DAG: "target": "s:5Basic1PP"
