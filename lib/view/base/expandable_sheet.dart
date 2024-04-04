import 'package:flutter/material.dart';

class ExpandableBottomSheet extends StatefulWidget {
  final Widget expandableContent;

  final Widget background;

  final Widget? persistentHeader;

  final Widget? persistentFooter;

  final double persistentContentHeight;

  final Duration animationDurationExtend;

  final Duration animationDurationContract;

  final Curve animationCurveExpand;

  final Curve animationCurveContract;

  final Function()? onIsExtendedCallback;

  final Function()? onIsContractedCallback;

  final bool enableToggle;

  final bool isDraggable;

  final bool initialExpand;

  ///
  const ExpandableBottomSheet({
    Key? key,
    required this.expandableContent,
    required this.background,
    this.persistentHeader,
    this.persistentFooter,
    this.persistentContentHeight = 0.0,
    this.animationCurveExpand = Curves.ease,
    this.animationCurveContract = Curves.ease,
    this.animationDurationExtend = const Duration(milliseconds: 250),
    this.animationDurationContract = const Duration(milliseconds: 250),
    this.onIsExtendedCallback,
    this.onIsContractedCallback,
    this.enableToggle = false,
    this.isDraggable = true,
    this.initialExpand = false,
  })  : assert(persistentContentHeight >= 0),
        super(key: key);

  @override
  ExpandableBottomSheetState createState() => ExpandableBottomSheetState();
}

class ExpandableBottomSheetState extends State<ExpandableBottomSheet>
    with TickerProviderStateMixin {
  final GlobalKey _contentKey = GlobalKey(debugLabel: 'contentKey');
  final GlobalKey _headerKey = GlobalKey(debugLabel: 'headerKey');
  final GlobalKey _footerKey = GlobalKey(debugLabel: 'footerKey');

  late AnimationController _controller;

  double _draggableHeight = 0;
  double? _positionOffset;
  double _startOffsetAtDragDown = 0;
  double? _startPositionAtDragDown = 0;

  double _minOffset = 0;
  double _maxOffset = 0;

  double _animationMinOffset = 0;

  AnimationStatus _oldStatus = AnimationStatus.dismissed;

  bool _useDrag = true;
  bool _callCallbacks = false;

  /// Expands the content of the widget.
  void expand() {
    _afterUpdateWidgetBuild(false);
    _callCallbacks = true;
    _animateToTop();
  }

  /// Contracts the content of the widget.
  void contract() {
    _afterUpdateWidgetBuild(false);
    _callCallbacks = true;
    _animateToBottom();
  }

  /// The status of the expansion.
  ExpansionStatus get expansionStatus {
    if (_positionOffset == null) return ExpansionStatus.contracted;
    if (_positionOffset == _maxOffset) return ExpansionStatus.contracted;
    if (_positionOffset == _minOffset) return ExpansionStatus.expanded;
    return ExpansionStatus.middle;
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0.0,
      upperBound: 1.0,
      value: 1.0, // Start fully expanded
    );
    _controller.addStatusListener(_handleAnimationStatusUpdate);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _afterUpdateWidgetBuild(true);
      if (widget.initialExpand) {
        expand();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _afterUpdateWidgetBuild(false));
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: Stack(
            clipBehavior: Clip.hardEdge,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: widget.background,
              ),
              AnimatedBuilder(
                animation: _controller,
                builder: (_, Widget? child) {
                  if (_controller.isAnimating) {
                    _positionOffset = _animationMinOffset +
                        _controller.value * _draggableHeight;
                  }
                  return Positioned(
                    top: _positionOffset,
                    right: 0.0,
                    left: 0.0,
                    child: child!,
                  );
                },
                child: GestureDetector(
                  onTap: _toggle,
                  onVerticalDragDown: widget.isDraggable ? _dragDown : (_) {},
                  onVerticalDragUpdate:
                      widget.isDraggable ? _dragUpdate : (_) {},
                  onVerticalDragEnd: widget.isDraggable ? _dragEnd : (_) {},
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                          key: _headerKey,
                          child: widget.persistentHeader ?? Container()),
                      Container(
                        key: _contentKey,
                        child: widget.expandableContent,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
            key: _footerKey, child: widget.persistentFooter ?? Container()),
      ],
    );
  }

  void _handleAnimationStatusUpdate(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      if (_oldStatus == AnimationStatus.forward) {
        setState(() {
          _draggableHeight = _maxOffset - _minOffset;
          _positionOffset = _minOffset;
        });
        if (widget.onIsExtendedCallback != null && _callCallbacks) {
          widget.onIsExtendedCallback!();
        }
      }
      if (_oldStatus == AnimationStatus.reverse) {
        setState(() {
          _draggableHeight = _maxOffset - _minOffset;
          _positionOffset = _maxOffset;
        });
        if (widget.onIsContractedCallback != null && _callCallbacks) {
          widget.onIsContractedCallback!();
        }
      }
    }
  }

  void _afterUpdateWidgetBuild(bool isFirstBuild) {
    double headerHeight = _headerKey.currentContext!.size!.height;
    double footerHeight = _footerKey.currentContext!.size!.height;
    double contentHeight = _contentKey.currentContext!.size!.height;

    double checkedPersistentContentHeight =
        (widget.persistentContentHeight < contentHeight)
            ? widget.persistentContentHeight
            : contentHeight;

    _minOffset =
        context.size!.height - headerHeight - contentHeight - footerHeight;
    _maxOffset = context.size!.height -
        headerHeight -
        footerHeight -
        checkedPersistentContentHeight;

    if (!isFirstBuild) {
      _positionOutOfBounds();
    } else {
      setState(() {
        _positionOffset = _maxOffset;
        _draggableHeight = _maxOffset - _minOffset;
      });
    }
  }

  void _positionOutOfBounds() {
    if (_positionOffset! < _minOffset) {
      //the extend is larger than contentHeight
      _callCallbacks = false;
      _animateToMin();
    } else {
      if (_positionOffset! > _maxOffset) {
        //the extend is smaller than persistentContentHeight
        _callCallbacks = false;
        _animateToMax();
      } else {
        _draggableHeight = _maxOffset - _minOffset;
      }
    }
  }

  void _animateOnIsAnimating() {
    if (_controller.isAnimating) {
      _controller.stop();
    }
  }

  void _toggle() {
    if (widget.enableToggle) {
      if (expansionStatus == ExpansionStatus.expanded) {
        _callCallbacks = true;
        _animateToBottom();
      }
      if (expansionStatus == ExpansionStatus.contracted) {
        _callCallbacks = true;
        _animateToTop();
      }
    }
  }

  void _dragDown(DragDownDetails details) {
    if (_controller.isAnimating) {
      _useDrag = false;
    } else {
      _useDrag = true;
      _startOffsetAtDragDown = details.localPosition.dy;
      _startPositionAtDragDown = _positionOffset;
    }
  }

  void _dragUpdate(DragUpdateDetails details) {
    if (!_useDrag) return;
    double offset = details.localPosition.dy;
    double newOffset =
        _startPositionAtDragDown! + offset - _startOffsetAtDragDown;
    if (_minOffset <= newOffset && _maxOffset >= newOffset) {
      setState(() {
        _positionOffset = newOffset;
      });
    } else {
      if (_minOffset > newOffset) {
        setState(() {
          _positionOffset = _minOffset;
        });
      }
      if (_maxOffset < newOffset) {
        setState(() {
          _positionOffset = _maxOffset;
        });
      }
    }
  }

  void _dragEnd(DragEndDetails details) {
    if (_startPositionAtDragDown == _positionOffset || !_useDrag) return;
    if (details.primaryVelocity! < -250) {
      //drag up ended with high speed
      _callCallbacks = true;
      _animateToTop();
    } else {
      if (details.primaryVelocity! > 250) {
        //drag down ended with high speed
        _callCallbacks = true;
        _animateToBottom();
      } else {
        if (_positionOffset == _maxOffset &&
            widget.onIsContractedCallback != null) {
          widget.onIsContractedCallback!();
        }
        if (_positionOffset == _minOffset &&
            widget.onIsExtendedCallback != null) {
          widget.onIsExtendedCallback!();
        }
      }
    }
  }

  void _animateToTop() {
    _animateOnIsAnimating();
    _controller.value = (_positionOffset! - _minOffset) / _draggableHeight;
    _animationMinOffset = _minOffset;
    _oldStatus = AnimationStatus.forward;
    _controller.animateTo(
      0.0,
      duration: widget.animationDurationExtend,
      curve: widget.animationCurveExpand,
    );
  }

  void _animateToBottom() {
    _animateOnIsAnimating();

    _controller.value = (_positionOffset! - _minOffset) / _draggableHeight;
    _animationMinOffset = _minOffset;
    _oldStatus = AnimationStatus.reverse;
    _controller.animateTo(
      1.0,
      duration: widget.animationDurationContract,
      curve: widget.animationCurveContract,
    );
  }

  void _animateToMax() {
    _animateOnIsAnimating();

    _controller.value = 1.0;
    _draggableHeight = _positionOffset! - _maxOffset;
    _animationMinOffset = _maxOffset;
    _oldStatus = AnimationStatus.reverse;
    _controller.animateTo(
      0.0,
      duration: widget.animationDurationExtend,
      curve: widget.animationCurveExpand,
    );
  }

  void _animateToMin() {
    _animateOnIsAnimating();

    _controller.value = 1.0;
    _draggableHeight = _positionOffset! - _minOffset;
    _animationMinOffset = _minOffset;
    _oldStatus = AnimationStatus.forward;
    _controller.animateTo(
      0.0,
      duration: widget.animationDurationContract,
      curve: widget.animationCurveContract,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

/// The status of the expandable content.
enum ExpansionStatus { expanded, middle, contracted }
