import 'package:flutter/foundation.dart';

final class StreamToListenable extends ChangeNotifier {
  StreamToListenable(Stream<dynamic> stream) {
    stream.listen((_) => notifyListeners());
  }
}
