import 'package:ar_test_project/routes/main_index.dart';

part 'env.g.dart';

@JsonSerializable()
class ENV {
  final String? apiUrl;
  final String? apiVersion;

  ENV({this.apiUrl, this.apiVersion});


  factory ENV.fromJson(Map<String, dynamic> json) => _$ENVFromJson(json);
  Map<String, dynamic> toJson() => _$ENVToJson(this);
}