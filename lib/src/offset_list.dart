import 'dart:collection';

/// [OffsetList] is a list with an offset for accessing elements. This is useful for correctly implementing mathematical
/// formulas that assume a different starting index than 0, Such as https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance
class OffsetList<E> extends ListBase<E> {
  OffsetList({required this.offset}) {
    _innerList = [];
  }

  OffsetList.filled({required int len, required this.offset, required E val}) {
    _innerList = List.filled(len, val);
  }

  OffsetList.fromList({required this.offset, required List<E> list}) : _innerList = list;

  late final List<E> _innerList;
  final int offset;

  //************************************************************************//

  @override
  E operator [](int index) {
    return _innerList[index - offset];
  }

  @override
  void operator []=(int index, E value) {
    _innerList[index - offset] = value;
  }

  @override
  void add(E element) => _innerList.add(element);

  @override
  void addAll(Iterable<E> iterable) => _innerList.addAll(iterable);

  //************************************************************************//

  @override
  int get length => _innerList.length;

  @override
  set length(int newLength) {
    _innerList.length = newLength;
  }
}