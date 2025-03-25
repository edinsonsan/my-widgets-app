import 'package:flutter/material.dart';

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
  ),
  MenuItems(
    titulo: 'Progress Indicators', 
    subTitulo: 'Generales y controlados', 
    link: '/progress', 
    icon: Icons.refresh_outlined
  ),
  MenuItems(
    titulo: 'Snackbar y Diálogos', 
    subTitulo: 'Indicadores en pantalla', 
    link: '/snackbar', 
    icon: Icons.info_outline
  ),
  MenuItems(
    titulo: 'Animate Container', 
    subTitulo: 'Statefull widget Animado', 
    link: '/animated', 
    icon: Icons.check_box_outline_blank_outlined,
  ),
  MenuItems(
    titulo: 'UI Controles', 
    subTitulo: 'Una serie de controles de Flutter', 
    link: '/ui-controls', 
    icon: Icons.car_rental_outlined,
  ),
  MenuItems(
    titulo: 'Introducción a la Aplicación', 
    subTitulo: 'Pequeño tutorial introductorio', 
    link: '/tutorial', 
    icon: Icons.accessibility_new_outlined,
  ),
];
