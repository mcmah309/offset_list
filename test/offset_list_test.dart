import 'package:test/test.dart';
import 'package:offset_list/offset_list.dart';

void main() {
  group('OffsetList tests', () {
    test('Create an OffsetList with a specific offset', () {
      final offset = 5;
      final list = OffsetList<int>(offset: offset);

      expect(list.offset, offset);
      expect(list.length, 0);
    });

    test('Create an OffsetList filled with a specific value', () {
      final offset = -3;
      final length = 5;
      final value = 'test';
      final list = OffsetList<String>.filled(len: length, offset: offset, val: value);

      expect(list.offset, offset);
      expect(list.length, length);
      expect(list[-3], List.filled(length, value)[0]);
      expect(list[1], List.filled(length, value)[4]);
    });

    test('Create an OffsetList from an existing list', () {
      final offset = 2;
      final originalList = [1, 2, 3, 4, 5];
      final list = OffsetList<int>.fromList(offset: offset, list: originalList);

      expect(list.offset, offset);
      expect(list.length, originalList.length);
    });

    test('Access elements with offset', () {
      final offset = 3;
      final elements = ['a', 'b', 'c', 'd', 'e'];
      final list = OffsetList<String>.fromList(offset: offset, list: elements);

      expect(list[offset], elements[0]);
      expect(list[offset + 1], elements[1]);
      expect(list[offset + 2], elements[2]);
      expect(list[offset + 3], elements[3]);
      expect(list[offset + 4], elements[4]);
    });

    test('Modify elements with offset', () {
      final offset = -2;
      final elements = [1, 2, 3, 4, 5];
      final list = OffsetList<int>.fromList(offset: offset, list: elements);

      list[offset] = 10;
      list[offset + 1] = 20;

      expect(list[offset], 10);
      expect(list[offset + 1], 20);
      expect(list[offset + 2], 3);
    });

    test('Add elements to the list', () {
      final offset = 0;
      final list = OffsetList<int>(offset: offset);

      list.add(1);
      list.add(2);

      expect(list[offset], 1);
      expect(list[offset + 1], 2);
    });

    test('Add elements from an iterable', () {
      final offset = -1;
      final list = OffsetList<int>(offset: offset);

      list.addAll([10, 20, 30]);

      expect(list[offset], 10);
      expect(list[offset + 1], 20);
      expect(list[offset + 2], 30);
    });

    test('Modify the length of the list', () {
      final offset = 0;
      final list = OffsetList<int?>(offset: offset);

      list.addAll([1, 2, 3]);
      expect(list.length, 3);

      list.length = 5;
      expect(list.length, 5);
      expect(list[offset + 3], null);
      expect(list[offset + 4], null);
    });
  });
}
