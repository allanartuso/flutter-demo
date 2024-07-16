import 'package:flutter_application_1/shared/data-access/rest/base_model.dart';
import 'package:flutter_application_1/shared/data-access/rest/rest_service.dart';

abstract class FormRepository<DTO extends ResourceDto,
    CREATE_DTO extends ResourceDto> {
  final String url;
  final HttpService httpService;
  final DTO Function(Map<String, dynamic> json) fromJson;

  FormRepository(
    this.httpService,
    this.url,
    this.fromJson,
  );

  Future<DTO> loadResource(String id) async {
    final response = await httpService.getResource('$url/$id');
    return fromJson(response);
  }

  Future<DTO> saveResource(DTO resource) async {
    final String id = resource.id;
    final response = await httpService.put('$url/$id', resource);
    return fromJson(response);
  }

  Future<DTO> createResource(CREATE_DTO resource) async {
    final response = await httpService.post(url, resource);
    return fromJson(response);
  }

  Future<void> deleteResource(String id) async {
    await httpService.delete('$url/$id');
  }
}
