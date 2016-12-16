//===--- PlatformOverlayShims.h - Compatibility decls -----------*- C++ -*-===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2016 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//
#ifndef SWIFT_STDLIB_SHIMS_PLATFORM_OVERLAY_H
#define SWIFT_STDLIB_SHIMS_PLATFORM_OVERLAY_H

#include <errno.h>

static inline int _swift_Platform_getErrno(void) {
  return errno;
}

static inline void _swift_Platform_setErrno(int newValue) {
  errno = newValue;
}

#endif // SWIFT_STDLIB_SHIMS_PLATFORM_OVERLAY_H

