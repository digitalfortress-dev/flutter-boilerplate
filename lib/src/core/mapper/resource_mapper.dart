import 'package:flutter_clean_architecture/gen/l10n/res.dart';
import 'package:flutter_clean_architecture/gen/l10n/res_en.dart';
import 'package:flutter_clean_architecture/gen/l10n/res_vi.dart';

import 'mapper.dart';

class ResourceMapper extends Mapper<String, Resource> {
  @override
  Future<String> mapperFrom(Resource data) => throw UnimplementedError();

  @override
  Future<Resource> mapperTo(String data) async {
    switch (data) {
      case 'vi':
        return ResourceVi();

      default:
        return ResourceEn();
    }
  }
}
