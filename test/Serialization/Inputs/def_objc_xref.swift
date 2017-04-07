import AppKit
import NullabilityChanges

public class MyObjectFactorySub : NSObjectFactorySub {
  public override init() { }
}

public class NullabilityChangesSub: NullabilityChanges {
  public override var nonnullThenNullableProp: Any { didSet {} }
  public override var nullableThenNonnullProp: Any? { didSet {} }

  public override func nonnullThenNullableMethod(_ arg: Any) -> Any { return arg }
  public override func nonnullThenNullableMethod(_ arg: Any, another _: Any) -> Any { return arg }

  public override func nullableThenNonnullMethod(_ arg: Any?) -> Any? { return arg }
  public override func nullableThenNonnullMethod(_ arg: Any?, another _: Any?) -> Any? { return arg }
}
