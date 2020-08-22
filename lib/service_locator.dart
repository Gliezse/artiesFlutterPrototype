import 'package:arties_flutter_prototype/providers/auth/auth_provider.dart';
import 'package:arties_flutter_prototype/providers/root_provider.dart';
import 'package:arties_flutter_prototype/providers/storage/storage_provider.dart';
import 'package:arties_flutter_prototype/providers/user/user_provider.dart';
import 'package:arties_flutter_prototype/scoped_model/base_scoped_model.dart';
import 'package:arties_flutter_prototype/scoped_model/models/general/general_data_model.dart';
import 'package:arties_flutter_prototype/views/home/model/home_view_model.dart';
import 'package:arties_flutter_prototype/views/home/model/profile_section_model.dart';
import 'package:arties_flutter_prototype/views/login/model/login_page_model.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Gestor para inyección de dependencias
GetIt locator = GetIt();

// Se declaran propiedades y clases a las que hara referencia el locator
Future setupLocator() async {
  // Storage
  locator.registerSingleton<SharedPreferences>(await SharedPreferences.
  getInstance());

  // Providers
  locator.registerLazySingleton<RootProvider>(() => RootProvider());
  locator.registerLazySingleton<AuthProvider>(() => AuthProvider());
  locator.registerLazySingleton<StorageProvider>(() => StorageProvider());
  locator.registerLazySingleton<UserProvider>(() => UserProvider());

  // Para desarrollo más cómodo declaramos como singletons los modelos globales
  locator.registerLazySingleton<GeneralDataModel>(() => GeneralDataModel());

  // Registrar modelos de vistas
  locator.registerFactory<LoginPageModel>(() => LoginPageModel());
  locator.registerFactory<HomeViewModel>(() => HomeViewModel());
  locator.registerFactory<ProfileSectionModel>(() => ProfileSectionModel());
}

/// Registro de los modelos que engloban todas las pantallas y componentes.
/// 
/// USO: Añadir nueva instancia de [BaseScopedModel<ModeloDeseado>] y llamar a su [model].
List<BaseScopedModel> getGlobalModels() {
  return [
    BaseScopedModel<GeneralDataModel>(
      model: locator<GeneralDataModel>(),
    ),
  ];
}