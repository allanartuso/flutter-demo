import 'package:flutter_application_1/shared/data-model/common/request_options.dart';

abstract class ListRepository<DTO, PARAMS> {
  Future<List<DTO>> loadResources(RequestOptions<PARAMS> params);
}
