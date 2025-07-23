import 'package:flutter/material.dart';
import 'package:pokedex_app/features/pokemon/presentation/widgets/pokemon_card.dart';

class PokemonListScreend extends StatelessWidget {
  const PokemonListScreend({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [PokemonCard()],
      ),
    );
  }
}
