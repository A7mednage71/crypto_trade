import 'package:dio/dio.dart';

class CurrentPageModel {
  final int page;

  CurrentPageModel({required this.page});

  FormData toFormData() {
    return FormData.fromMap({'page': page});
  }
}
