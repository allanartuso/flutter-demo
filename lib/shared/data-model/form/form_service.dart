abstract class FormService<DTO, CREATE_DTO> {
  Future<DTO> loadResource(String id);

  Future<DTO> saveResource(DTO resource);

  Future<void> deleteResource(String id);

  Future<DTO> createResource(CREATE_DTO resource);
}
