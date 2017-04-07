@interface Base
- (nonnull instancetype)init;
@end

#ifdef CHANGE
# define NONNULL_TO_NULLABLE _Nullable
# define NULLABLE_TO_NONNULL _Nonnull
#else
# define NONNULL_TO_NULLABLE _Nonnull
# define NULLABLE_TO_NONNULL _Nullable
#endif

@interface NullabilityChanges : Base
@property id NONNULL_TO_NULLABLE nonnullThenNullableProp;
@property id NULLABLE_TO_NONNULL nullableThenNonnullProp;

- (id NONNULL_TO_NULLABLE)nonnullThenNullableMethod:(id NONNULL_TO_NULLABLE)arg;
- (id NONNULL_TO_NULLABLE)nonnullThenNullableMethod:(id NONNULL_TO_NULLABLE)arg another:(id NONNULL_TO_NULLABLE)arg2;

- (id NULLABLE_TO_NONNULL)nullableThenNonnullMethod:(id NULLABLE_TO_NONNULL)arg;
- (id NULLABLE_TO_NONNULL)nullableThenNonnullMethod:(id NULLABLE_TO_NONNULL)arg another:(id NULLABLE_TO_NONNULL)arg2;
@end
