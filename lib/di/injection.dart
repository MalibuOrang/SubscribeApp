import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:subscribe_app/data/datasources/subscription_local_data_source.dart';
import 'package:subscribe_app/data/repositories/subscription_repository_impl.dart';
import 'package:subscribe_app/domain/repositories/subscription_repository.dart';
import 'package:subscribe_app/domain/usecases/get_subscription_status_usecase.dart';
import 'package:subscribe_app/domain/usecases/set_subscription_usecase.dart';
import 'package:subscribe_app/domain/usecases/get_subscription_plans_usecase.dart';
import 'package:subscribe_app/presentation/providers/subscription_provider.dart';
import 'package:subscribe_app/presentation/providers/app_state_provider.dart';
import 'package:subscribe_app/presentation/providers/subscription_plans_provider.dart';

// Класс для внедрения зависимостей
final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // Инициализируем SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  // Регистрируем локальный источник данных
  getIt.registerLazySingleton<SubscriptionLocalDataSource>(
    () => SubscriptionLocalDataSourceImpl(getIt()),
  );

  // Регистрируем репозиторий
  getIt.registerLazySingleton<SubscriptionRepository>(
    () => SubscriptionRepositoryImpl(getIt()),
  );

  // Регистрируем use cases
  getIt.registerLazySingleton<GetSubscriptionStatusUseCase>(
    () => GetSubscriptionStatusUseCaseImpl(getIt()),
  );

  getIt.registerLazySingleton<SetSubscriptionUseCase>(
    () => SetSubscriptionUseCaseImpl(getIt()),
  );

  getIt.registerLazySingleton<GetSubscriptionPlansUseCase>(
    () => GetSubscriptionPlansUseCaseImpl(getIt()),
  );

  // Регистрируем провайдеры
  getIt.registerFactory<SubscriptionProvider>(
    () => SubscriptionProvider(
      getIt<GetSubscriptionStatusUseCase>(),
      getIt<SetSubscriptionUseCase>(),
      getIt<GetSubscriptionPlansUseCase>(),
    ),
  );

  getIt.registerFactory<AppStateProvider>(
    () => AppStateProvider(getIt<SubscriptionProvider>()),
  );

  getIt.registerFactory<SubscriptionPlansProvider>(
    () => SubscriptionPlansProvider(getIt<SubscriptionProvider>()),
  );
}
