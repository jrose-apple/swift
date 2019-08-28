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

public func SIMDAdd(_ a: SIMD4<Int32>, _ b: SIMD4<Int32>) -> SIMD4<Int32> {
  return a &+ b
}

public func SIMDSub(_ a: SIMD4<Int32>, _ b: SIMD4<Int32>) -> SIMD4<Int32> {
  return a &- b
}

@inline(never)
public func run_SIMDBasicAdd(N: Int) {
  var a = identity(SIMD4<Int32>(1, 2, 3, 4))
  let b = identity(SIMD4<Int32>(5, 6, 7, 8))

  for _ in 0..<(N * 100) {
    a = a &+ b
  }

  blackHole(a)
}
