import 'package:freezed_annotation/freezed_annotation.dart';
part 'mainFailure.freezed.dart';

@freezed
class MainFailure with _$MainFailure {
  const factory MainFailure.clientFailure() = Clientfailure;
  const factory MainFailure.serverFailure() = ServerFailure;
}
