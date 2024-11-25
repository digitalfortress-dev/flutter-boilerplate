import 'res.dart';

/// The translations for Vietnamese (`vi`).
class ResourceVi extends Resource {
  ResourceVi([String locale = 'vi']) : super(locale);

  @override
  String get helloWorld => 'Hi, chào cậu ᰔᩚ, tớ là Flutter (>‿◠)✌  !';

  @override
  String get appName => 'Codebase Clean Architecture';

  @override
  String get setting => 'Cài đặt';

  @override
  String get cancel => 'Hủy';

  @override
  String get ok => 'Đồng ý';

  @override
  String get errorInternetConnection => 'Vui lòng kiểm tra kết nối mạng!';

  @override
  String get retry => 'Tải lại';
}
