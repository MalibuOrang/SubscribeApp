import 'package:shared_preferences/shared_preferences.dart';
import 'package:subscribe_app/core/constants/app_constants.dart';

// Абстрактный класс для локального источника данных подписки
abstract class SubscriptionLocalDataSource {
  Future<bool> isSubscribed();
  Future<void> setSubscription(bool subscribed);
}

// Реализация локального источника данных подписки
class SubscriptionLocalDataSourceImpl implements SubscriptionLocalDataSource {
  final SharedPreferences _sharedPreferences;

  SubscriptionLocalDataSourceImpl(this._sharedPreferences);

  @override
  Future<bool> isSubscribed() async {
    return _sharedPreferences.getBool(StorageKeys.subscriptionKey) ?? false;
  }

  @override
  Future<void> setSubscription(bool subscribed) async {
    await _sharedPreferences.setBool(StorageKeys.subscriptionKey, subscribed);
  }
}
