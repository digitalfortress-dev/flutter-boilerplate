abstract class ModelToEntityMapper<DataModel, EntityItem> {
  EntityItem mapperTo(DataModel data);

  DataModel mapperFrom(EntityItem data) => throw UnimplementedError();
}
