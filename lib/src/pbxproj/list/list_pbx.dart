import 'package:xcode_parser/src/pbxproj/interfaces/base_components.dart';
import 'package:xcode_parser/src/pbxproj/list/element_of_list_pbx.dart';
import 'package:xcode_parser/src/pbxproj/pbxproj.dart';

class ListPbx extends NamedComponent {
  final List<ElementOfListPbx> _children;

  ListPbx(
    String uuid,
    List<ElementOfListPbx> children, {
    super.comment,
  })  : _children = children,
        super(uuid: uuid);

  operator [](int index) => _children[index];
  int get length => _children.length;

  @override
  String toString({int indentLevel = 0, bool removeN = false}) {
    String indent = Pbxproj.indent(indentLevel);
    StringBuffer sb = StringBuffer();
    sb.write('$indent$uuid = (\n');
    for (int i = 0; i < _children.length; i++) {
      sb.write('${_children[i].toString(indentLevel: indentLevel + 1)}\n');
    }
    sb.write('$indent);${removeN ? ' ' : '\n'}');
    return sb.toString();
  }

  void add(ElementOfListPbx element) {
    _children.add(element);
  }

  void insert(int index, ElementOfListPbx element) {
    _children.insert(index, element);
  }

  void insertAll(int index, Iterable<ElementOfListPbx> iterable) {
    _children.insertAll(index, iterable);
  }

  ElementOfListPbx get first => _children.first;

  ElementOfListPbx get last => _children.last;

  ElementOfListPbx removeAt(int index) => _children.removeAt(index);

  ElementOfListPbx removeLast() => _children.removeLast();

  void remove(Object? value) => _children.remove(value);

  @override
  ListPbx copyWith({
    String? uuid,
    List<ElementOfListPbx>? children,
    String? comment,
  }) {
    return ListPbx(
      uuid ?? this.uuid,
      children ?? _children,
      comment: comment ?? this.comment,
    );
  }
}
