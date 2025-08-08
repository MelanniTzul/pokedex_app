import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PokemonTypeChip extends StatelessWidget {
  final String type;
  const PokemonTypeChip({super.key, required this.type});

  Color _getPrincipalColor(String type) {
    switch (type.toLowerCase()) {
      case 'hoja':
        return Color(0xFF63BC5A);
      case 'agua':
        return Color(0xFF5090D6);
      case 'fuego':
        return Color(0xFFFF9D55);
      case 'electrico':
        return Color(0xFFF4D23C);
      case 'venenoso':
        return Color(0xFFB567CE);
      case 'volador':
        return Color(0xFF89AAE3);
      default:
        return Color(0xFF919AA2);
    }
  }

//89AAE3
  String _getIconType(String type) {
    switch (type.toLowerCase()) {
      case 'hoja':
        return 'hoja';
      case 'agua':
        return 'agua';
      case 'fuego':
        return 'fuego';
      case 'electrico':
        return 'electrico';
      case 'venenoso':
        return 'venenoso';
      case 'volador':
        return 'volador';
      default:
        return 'normal';
    }
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: _getPrincipalColor(type),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              //width: 20,
              //height: 20,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/pokemon_types_chips/${_getIconType(type)}.svg',
                  //width: 11,
                  //height: 12,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(width: 6),
            Text(
              type,
              style:
                  textStyle.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
            )
          ],
        ));
  }
}
