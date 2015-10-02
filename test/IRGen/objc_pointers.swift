// RUN: rm -rf %t && mkdir %t
// RUN: %build-irgen-test-overlays
// RUN: %target-swift-frontend(mock-sdk: -sdk %S/Inputs -I %t) -primary-file %s -emit-ir | FileCheck %s

// REQUIRES: CPU=x86_64
// REQUIRES: objc_interop

import Foundation

@objc class Foo : NSObject {
  // CHECK: define internal void @_TToFC13objc_pointers3Foo16pointerArgumentsfS0_FTGVs20UnsafeMutablePointerSi_1yGS1_T__1zGVs13UnsafePointerSi_1wGVs33AutoreleasingUnsafeMutablePointerGSqS0____T_(%0*, i8*, i64*, i8*, i64*, %0**)
  @objc func pointerArguments(x: UnsafeMutablePointer<Int>,
                              y: UnsafeMutablePointer<Void>,
                              z: UnsafePointer<Int>,
                              w: AutoreleasingUnsafeMutablePointer<Foo?>) {}
}
