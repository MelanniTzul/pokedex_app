import 'package:flutter/material.dart';

class TypeFilter extends StatefulWidget {
  const TypeFilter({super.key});

  @override
  State<TypeFilter> createState() => TypeFilterState();
}

class TypeFilterState extends State<TypeFilter> {
  String selectedTypeFilter = 'Todos los tipos';
  final List<String> pokemonTypes = [
    'Todos los tipos',
    'Agua',
    'Dragon',
    'Eléctrico',
    'Fada',
    'Fantasma',
    'Fuego',
    'Hielo',
    'Grama',
  ];

  Color _getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'agua':
        return const Color(0xFF5090D6);
      case 'dragon':
        return const Color(0xFF0B6DC3);
      case 'eléctrico':
        return const Color(0xFFF4D23C);
      case 'fada':
        return const Color(0xFFEC8FE6);
      case 'fantasma':
        return const Color(0xFF5269AD);
      case 'fuego':
        return const Color(0xFFFF9D55);
      case 'hielo':
        return const Color(0xFF73CEC0);
      case 'grama':
        return const Color(0xFF63BC5A);
      default:
        return const Color(0xFFD97845);
    }
  }

  void _showTypeFilter() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  'Seleccioná el tipo',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 20),
                ...pokemonTypes.map((type) {
                  return Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 12),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedTypeFilter = type;
                        });
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _getTypeColor(type),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        type,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w900),
                      ),
                    ),
                  );
                })
                // Aquí puedes agregar más widgets, como ListTile de tipos
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton.icon(
        //icon: const Icon(Icons.filter_list),
        label: Text(selectedTypeFilter),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black87,
          foregroundColor: Colors.grey[200],
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        onPressed: _showTypeFilter,
      ),
    );
  }
}
