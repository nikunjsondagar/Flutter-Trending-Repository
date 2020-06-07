import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/item_repository.dart';

class RepoBloc {
  final _repository = Repository();
  final _repoFetcher = PublishSubject<List<ItemRepo>>();

  Observable<List<ItemRepo>> get allRepo => _repoFetcher.stream;

  fetchAllRepo() async {
    List<ItemRepo> modelList = await _repository.fetchAllRepo();
    _repoFetcher.sink.add(modelList);
  }

  dispose() {
    _repoFetcher.close();
  }
}

final bloc = RepoBloc();
