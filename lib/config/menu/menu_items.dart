import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Botones',
    subTitle: 'Varios botones en Flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: 'Tarjetas',
    subTitle: 'Varios tarjetas en Flutter',
    link: '/cards',
    icon: Icons.credit_card,
  ),
  MenuItem(
    title: 'Animaciones',
    subTitle: 'Varias animaciones en Flutter',
    link: '/animated',
    icon: Icons.animation,
  ),
  MenuItem(
    title: 'Tutorial',
    subTitle: 'Tutorial de la app',
    link: '/app-tutorial',
    icon: Icons.school,
  ),
  MenuItem(
    title: 'Scroll infinito',
    subTitle: 'Scroll infinito en Flutter',
    link: '/infinite-scroll',
    icon: Icons.vertical_align_bottom,
  ),
  MenuItem(
    title: 'Progress Indicator',
    subTitle: 'Varios indicadores de progreso en Flutter',
    link: '/progress',
    icon: Icons.hourglass_empty,
  ),
  MenuItem(
    title: 'Snackbar',
    subTitle: 'Varios snackbar en Flutter',
    link: '/snackbar',
    icon: Icons.notifications,
  ),
  MenuItem(
    title: 'Controles UI',
    subTitle: 'Varios controles de UI en Flutter',
    link: '/ui-controls',
    icon: Icons.settings,
  ),
];
