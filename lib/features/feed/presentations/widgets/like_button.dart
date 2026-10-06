import "package:flutter/material.dart";

class LikeButton extends StatefulWidget {
  final int initialLikeCount;
  final bool initialIsLiked;

  final ValueChanged<bool>? onLikeChanged;

  const LikeButton({
    super.key,
    required this.initialLikeCount,
    required this.initialIsLiked,
    this.onLikeChanged,
  });

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton>{
  late bool _isLiked;
  late int _likeCount;

  @override
  void initState(){
    super.initState();
    _isLiked = widget.initialIsLiked;
    _likeCount = widget.initialLikeCount;
  }

  @override
  void didUpdateWidget(covariant LikeButton oldWidget){
    super.didUpdateWidget(oldWidget);
    if(oldWidget.initialIsLiked != widget.initialIsLiked || oldWidget.initialLikeCount != widget.initialLikeCount){
      _likeCount = widget.initialLikeCount;
      _isLiked = widget.initialIsLiked;

    }
  }

  void _toggleLike(){
    setState((){
      _isLiked = !_isLiked;
      _likeCount = !_isLiked ? _likeCount - 1: _likeCount +1;
    });
    widget.onLikeChanged?.call(_isLiked);
  }

  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisSize: MainAxisSize.min,
      children:[
        IconButton(
          padding : EdgeInsets.zero,
          constraints: const BoxConstraints(),
          icon: Icon(
            _isLiked ? Icons.favorite : Icons.favorite_border,
            color: _isLiked ? Colors.red : Colors.grey,
            size: 20
          ),
          onPressed: _toggleLike,
        ),
        const SizedBox(width: 6),
        Text(
          '$_likeCount',
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w500,
          ),
        ),
      ]
    );
  }
}