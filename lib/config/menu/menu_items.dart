import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuItems {
  final String titulo;
  final String subTitulo;
  final String link;
  final IconData icon;

  const MenuItems({
    required this.titulo,
    required this.subTitulo,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItems>[
  MenuItems(
    titulo: 'Botones', 
    subTitulo: 'Varios Botones en Flutter', 
    link: '/buttons', 
    icon: Icons.smart_button_outlined
  ),
  MenuItems(
    titulo: 'Tarjetas', 
    subTitulo: 'Un contenedor estilizado', 
    link: '/cards', 
    icon: Icons.credit_card_outlined
  )
];
