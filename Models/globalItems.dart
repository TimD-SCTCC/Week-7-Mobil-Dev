import 'item.dart';

class GlobalItems {
  static final GlobalItems _item = GlobalItems._instance();

  factory GlobalItems() {
    return _item;
  }

  GlobalItems._instance();

  List<Item> items = [
    Item(1, "Doge-1", "Dogecoin--1"),
    Item(2, "Doge-2", "Dogecoin--2"),
    Item(3, "Doge-3", "Dogecoin--3"),
    Item(4, "Doge-4", "Dogecoin--4"),
    Item(5, "Doge-5", "Dogecoin--5"),
    Item(6, "Doge-6", "Dogecoin--6"),
    Item(7, "Doge-7", "Dogecoin--7"),
    Item(8, "Doge-8", "Dogecoin--8"),
    Item(9, "Doge-9", "Dogecoin--9"),
    Item(10, "Doge-10", "Dogecoin--10"),
  ];
}
