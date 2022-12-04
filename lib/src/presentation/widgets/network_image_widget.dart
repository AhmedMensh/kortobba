import 'package:flutter/material.dart';

import '../../core/colors.dart';

class NetworkImageWidget extends StatelessWidget {
  final String? path;
  final double?  height;
  final double? width;
  final BoxFit? fit;

  const NetworkImageWidget(
    this.path, {
    this.height,
    this.width,
    this.fit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      path ?? '',
      scale: 1.1,
      fit: fit,
      width: width,
      height: height,
      errorBuilder:
          (BuildContext? context, Object? object, StackTrace? stackTrace) {
        return Icon(
          Icons.error,
          color: Theme.of(context!).colorScheme.error,
        );
      },
      loadingBuilder: (BuildContext? context, Widget? child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child ?? const SizedBox();
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
            valueColor: const AlwaysStoppedAnimation(kRED_700),
          ),
        );
      },
    );
  }
}
