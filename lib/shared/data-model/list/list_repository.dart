import 'package:flutter_application_1/shared/data-model/common/request_options.dart';
import 'package:flutter_application_1/shared/data-access/rest/base_model.dart';
import 'package:flutter_application_1/shared/data-access/rest/rest_service.dart';

abstract class ListRepository<DTO extends ResourceDto, PARAMS> {
  final String url;
  final HttpService httpService;
  final DTO Function(Map<String, dynamic> json) fromJson;

  ListRepository(
    this.httpService,
    this.url,
    this.fromJson,
  );

  Future<List<DTO>> loadResources(RequestOptions<PARAMS> params) async {
    final responses = await httpService.getResources(url);
    return responses.map((response) => fromJson(response)).toList();
  }
}
