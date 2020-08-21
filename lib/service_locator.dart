import 'package:arties_flutter_prototype/scoped_model/base_scoped_model.dart';
import 'package:arties_flutter_prototype/scoped_model/models/general/user_model.dart';
import 'package:arties_flutter_prototype/views/home/model/home_page_model.dart';
import 'package:get_it/get_it.dart';

// Gestor para inyección de dependencias
GetIt locator = GetIt();

// Se declaran propiedades y clases a las que hara referencia el locator
void setupLocator() {
  // Para desarrollo más cómodo declaramos como singletons los modelos globales
  locator.registerLazySingleton<UserModel>(() => UserModel());

  // Registrar modelos de vistas
  locator.registerFactory<HomePageModel>(() => HomePageModel());
}

/// Registro de los modelos que engloban todas las pantallas y componentes.
/// 
/// USO: Añadir nueva instancia de [BaseScopedModel<ModeloDeseado>] y llamar a su [model].
List<BaseScopedModel> getGlobalModels() {
  return [
    BaseScopedModel<UserModel>(
      model: locator<UserModel>(),
    ),
  ];
}