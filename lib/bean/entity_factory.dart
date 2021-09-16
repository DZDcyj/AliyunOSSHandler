///
/// entity_factory
///
/// created by DZDcyj at 2021/9/16
///

typedef EntityGenerator<T> = T Function(dynamic json);

/// 实体生成器
class _Generator<T> {
  _Generator(this.generator, {this.name});

  final EntityGenerator<T> generator;
  final String name;

  String get keyName => name ?? T.toString();
}

/// 实体工厂
class EntityFactory {
  /// 创建实体对象
  static generate<T>(dynamic json) {
    EntityGenerator<T> generator = generators[T.toString()];
    return generator != null ? generator(json) : null;
  }

  /// 实体构建
  static final generators = Map.fromIterable(
    [
      // TODO: 添加实体类构造方法
      // _Generator<MapEntity>(
      //   (json) => MapEntity.fronJson(json),
      // ),
    ],
    key: (g) => g.keyName,
    value: (g) => g.generator,
  );

}
