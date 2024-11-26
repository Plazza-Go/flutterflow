import 'package:firebase_remote_config/firebase_remote_config.dart';

Future initializeFirebaseRemoteConfig() async {
  try {
    await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 1),
    ));
    await FirebaseRemoteConfig.instance.setDefaults(const {
      'is_mandatory': false,
      'app_version': 0.59,
    });
    await FirebaseRemoteConfig.instance.fetchAndActivate();
  } catch (error) {
    print(error);
  }
}

String getRemoteConfigString(String key) =>
    FirebaseRemoteConfig.instance.getString(key);

bool getRemoteConfigBool(String key) =>
    FirebaseRemoteConfig.instance.getBool(key);

int getRemoteConfigInt(String key) => FirebaseRemoteConfig.instance.getInt(key);

double getRemoteConfigDouble(String key) =>
    FirebaseRemoteConfig.instance.getDouble(key);