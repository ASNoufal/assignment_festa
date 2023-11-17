import 'package:assignment/infrastructure/Model/modelData.dart';
import 'package:assignment/infrastructure/repo/datafromapi.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dataprovider = FutureProvider.autoDispose<List<ModelData>>((ref) async {
  return ref.watch(DataFromApiprovider).getdatafromapi();
});
