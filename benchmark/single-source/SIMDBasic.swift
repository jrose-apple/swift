//===--- SIMDBasic.swift -------------------------------------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2019 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//

import TestsUtils

public let SIMDBasic = [
  BenchmarkInfo(name: "SIMDBasicAdd", runFunction: run_SIMDBasicAdd, tags: [.validation, .api]),
]

@inline(never)
public func run_SIMDBasicAdd(N: Int) {
  let range = identity(0..<N)

  var a = identity(SIMD4<Int32>(1, 2, 3, 4))
  let b = identity(SIMD4<Int32>(5, 6, 7, 8))

  for _ in range {
    a = a &+ b
  }

  blackHole(a)
}
