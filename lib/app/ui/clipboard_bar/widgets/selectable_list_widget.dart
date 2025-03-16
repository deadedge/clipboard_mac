import 'package:flutter/material.dart';

class SelectableListWidget<T> extends StatefulWidget {
  final List<T> items;
  final bool separator;
  final Widget? Function(BuildContext, int) itemBuilder;
  final Function(List<int>)? onItemsSelected;
  final Function()? onDeactive;
  final Color? checkBoxColor;
  final bool? deactive;
  const SelectableListWidget({
    super.key,
    required this.items,
    this.separator = false,
    required this.onItemsSelected,
    required this.itemBuilder,
    this.checkBoxColor,
    this.deactive,
    this.onDeactive,
  });

  @override
  State<SelectableListWidget<T>> createState() =>
      _SelectableListWidgetState<T>();
}

class _SelectableListWidgetState<T> extends State<SelectableListWidget<T>> {
  bool _isActive = false;
  bool _forceDeactive = false;
  final Map<int, bool> _internalMap = {};

  @override
  Widget build(BuildContext context) {
    _forceDeactive = widget.deactive ?? false;

    return ListView.separated(
      itemBuilder: _buildWidget,
      separatorBuilder:
          (context, index) =>
              widget.separator
                  ? Divider(height: 1, indent: 16, endIndent: 16)
                  : SizedBox.shrink(),
      itemCount: widget.items.length,
    );
  }

  Widget _buildWidget(BuildContext context, int index) {
    if ((!_internalMap.containsValue(true) && _internalMap.isNotEmpty) ||
        _forceDeactive) {
          
      _isActive = false;
      _forceDeactive = false;
      _internalMap.clear();
      widget.onDeactive?.call();
    }

    if (_isActive) {
      return Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Checkbox(
              value: (_internalMap[index] ?? false),
              activeColor: widget.checkBoxColor,
              onChanged: (state) {
                setState(() {
                  _internalMap[index] = !(_internalMap[index] ?? false);
                });
                _onItemsSelected();
              },
            ),
          ),
          Expanded(child: widget.itemBuilder(context, index)!),
        ],
      );
    }

    return GestureDetector(
      onLongPress: () {
        setState(() {
          _isActive = !_isActive;
          _internalMap[index] = true;
          _onItemsSelected();
        });
      },
      child: widget.itemBuilder(context, index)!,
    );
  }

  void _onItemsSelected() {
    if (widget.onItemsSelected != null) {
      widget.onItemsSelected!(
        _internalMap.entries
            .where((entry) => entry.value)
            .map((entry) => entry.key)
            .toList(),
      );
    }
  }
}
