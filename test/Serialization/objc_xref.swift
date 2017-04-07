// RUN: rm -rf %t && mkdir -p %t

// FIXME: BEGIN -enable-source-import hackaround
// RUN: %target-swift-frontend(mock-sdk: %clang-importer-sdk) -emit-module -o %t %clang-importer-sdk-path/swift-modules/Foundation.swift
// RUN: %target-swift-frontend(mock-sdk: %clang-importer-sdk) -emit-module -o %t %clang-importer-sdk-path/swift-modules/AppKit.swift
// FIXME: END -enable-source-import hackaround

// RUN: %target-swift-frontend(mock-sdk: %clang-importer-sdk-nosource -I %t) -I %S/Inputs/custom-modules -emit-module -o %t %S/Inputs/def_objc_xref.swift
// RUN: %target-swift-frontend(mock-sdk: %clang-importer-sdk-nosource -I %t) -I %S/Inputs/custom-modules -typecheck %s -verify
// RUN: %target-swift-frontend(mock-sdk: %clang-importer-sdk-nosource -I %t) -I %S/Inputs/custom-modules -typecheck %s -verify -Xcc -DCHANGE

// REQUIRES: objc_interop

import def_objc_xref

// Trigger deserialization of the MyObjectFactorySub initializer.
let sub = MyObjectFactorySub()

func test(obj: NullabilityChangesSub) {
  let _: Int = obj.nonnullThenNullableProp // expected-error {{cannot convert value of type 'Any' to specified type 'Int'}}
  let _: Int = obj.nullableThenNonnullProp // expected-error {{cannot convert value of type 'Any?' to specified type 'Int'}}

  let _: Int = obj.nonnullThenNullableMethod(_:) // expected-error {{cannot convert value of type '(Any) -> Any' to specified type 'Int'}}
  let _: Int = obj.nonnullThenNullableMethod(_:another:) // expected-error {{cannot convert value of type '(Any, Any) -> Any' to specified type 'Int'}}

  let _: Int = obj.nullableThenNonnullMethod(_:) // expected-error {{cannot convert value of type '(Any?) -> Any?' to specified type 'Int'}}
  let _: Int = obj.nullableThenNonnullMethod(_:another:) // expected-error {{cannot convert value of type '(Any?, Any?) -> Any?' to specified type 'Int'}}
}