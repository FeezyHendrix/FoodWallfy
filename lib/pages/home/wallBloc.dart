import 'package:foodwallfy/services/manager.dart';
import 'package:rxdart/rxdart.dart';
import 'package:foodwallfy/services/responses.dart';

class WallBloc {
  final wallsBloc = BehaviorSubject<List<Result>>();
  List<Result> wallsData = List<Result>();
  Observable<List<Result>> get wallpapers => wallsBloc.stream;

  Future fetchImages() async {
    try {
      ServiceManager sm = ServiceManager();
      List<Result> walls = await sm.fetchWalls();
      wallsBloc.sink.add(walls);
    } catch (error) {
      print(error);
    }
  }

  dispose() {
    wallsBloc.close();
  }
}