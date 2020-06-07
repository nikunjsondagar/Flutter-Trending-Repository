import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/item_repository.dart';

class RepoBloc {
  final _repository = Repository();
  final _repoFetcher = PublishSubject<List<ItemPost>>();

  Observable<List<ItemPost>> get allRepo => _repoFetcher.stream;

  fetchAllRepo() async {
    List<ItemPost> modelList = await _repository.fetchAllRepo();
    _repoFetcher.sink.add(modelList);
  }

  dispose() {
    _repoFetcher.close();
  }
}

final bloc = RepoBloc();
