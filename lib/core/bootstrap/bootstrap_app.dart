import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../config/app_config.dart';
import '../di/di.dart';

Future<void> bootstrapApp() async {
  await AppConfig.load();
  await Supabase.initialize(
    url: AppConfig.instance.supabaseUrl,
    publishableKey: AppConfig.instance.publishableKey,
  );
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );

  await configureDependencies();
  await getIt.allReady();
}
