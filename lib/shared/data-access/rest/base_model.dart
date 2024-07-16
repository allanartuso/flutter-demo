abstract class ResourceDto {
  final String id;
  Map<String, dynamic> toJson();

  ResourceDto({required this.id});
}
