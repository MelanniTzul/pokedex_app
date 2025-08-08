import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex_app/features/domain/entities/pokemon_enitity.dart';
import 'package:pokedex_app/features/pokemon/presentation/widgets/pokemon_type_chip.dart';

//state no recibe cosas
class PokemonCard extends StatefulWidget {
  final PokemonEnitity pokemon;
  const PokemonCard({super.key, required this.pokemon});

  @override
  State<PokemonCard> createState() => PokemonCardState();
}

class PokemonCardState extends State<PokemonCard> {
  bool isFavorite = false;
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
      default:
        return 'normal';
    }
  }

  Color _getBackGroundColor(String type) {
    switch (type.toLowerCase()) {
      case 'Hoja':
        return Color(0xFFEDF6EC);
      case 'Agua':
        return Color(0xFFEBF1F8);
      case 'Fuego':
        return Color(0xFFFCF3EB);
      case 'Electrico':
        return Color(0xFFFBF8E9);
      default:
        return Color(0xFFF1F2F3);
    }
  }

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
      default:
        return Color(0xFF919AA2);
    }
  }

  @override
  Widget build(BuildContext context) {
    final pokemon = widget.pokemon;
    final textStyle = Theme.of(context).textTheme;
    return Container(
        margin: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: _getBackGroundColor(pokemon.types[0]),
          borderRadius: BorderRadius.circular(16),
          //boxShadow: [BoxShadow(color: Colors.black, blurRadius: 8)]
        ),
        child: Row(children: [
          Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    Text(
                      'N°${pokemon.id}',
                      style: textStyle.bodyMedium?.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      pokemon.name,
                      style: textStyle.bodyMedium?.copyWith(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Text(
                    //   'ACÁ VA EL TIPO',
                    //   style: textStyle.bodyMedium,
                    // ),
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: pokemon.types.map((type) {
                        return PokemonTypeChip(type: type);
                      }).toList(),
                    ),
                    const SizedBox(height: 14),
                  ],
                ),
              )),
          Expanded(
              flex: 1,
              child: Stack(children: [
                Container(
                  height: 150,
                  //width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: _getPrincipalColor(pokemon.types[0])),
                  child: Stack(
                    children: [
                      Positioned.fill(
                          child: SvgPicture.asset(
                        'assets/pokemons_types/${_getIconType(pokemon.types[0])}.svg',
                      )),
                      Center(
                        child: Image.asset(
                          pokemon.image,
                          width: 94,
                          height: 94,
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                    top: 6,
                    right: 8,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2)),
                        child: Center(
                            child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.white,
                          size: 16,
                        )),
                      ),
                    )),
              ]))
        ]));
  }
}
