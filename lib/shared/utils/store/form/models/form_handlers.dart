// import 'package:flutter_application_1/shared/data-model/form/form_repository.dart';
// import 'package:flutter_application_1/shared/utils/store/form/models/form_state.dart';

// class FormEventHandlers {
//   static void load<T, C>(
//       FormState<T> state, FormRepository<T, C> repository, String id) async {
//     state.isLoading(true);

//     try {
//       final data = await repository.loadResource(id);
//       state.resource(data);
//     } catch (error) {
//       print(error);
//       state.error(error.toString());
//     } finally {
//       state.isLoading(false);
//     }
//   }

//   static void save<T, C>(
//       FormState<T> state, FormRepository<T, C> repository, T resource) async {
//     state.isLoading(true);
//     try {
//       final data = await repository.saveResource(resource);
//       state.resource(data);
//     } catch (error) {
//       print(error);
//       state.error(error.toString());
//     } finally {
//       state.isLoading(false);
//     }
//   }
// }
