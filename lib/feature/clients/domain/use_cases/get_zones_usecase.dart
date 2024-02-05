import 'package:dartz/dartz.dart';
import 'package:tezz_cafe/core/error/failures.dart';
import 'package:tezz_cafe/core/usecases/usecase.dart';
import 'package:tezz_cafe/feature/clients/data/models/zone_model.dart';
import 'package:tezz_cafe/feature/clients/domain/repositories/zone_repository.dart';

class GetZonesUseCase extends UseCase<String, List<ZoneModel>> {
  final ZoneRepository _zoneRepository;

  GetZonesUseCase(this._zoneRepository);

  @override
  Future<Either<Failure, List<ZoneModel>>> execute(String params) {
    return _zoneRepository.getZones(params);
  }
}
