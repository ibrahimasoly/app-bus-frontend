import 'package:bustransport/bloc/NavBarBottomBloc.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> liste = ['/', '/Ticket', '/Compte'];
    return BlocBuilder<NavBarIndexBottomBloc, NavBarBottomState>(
      builder: (context, state) {
        return BottomNavigationBar(
            elevation: 10,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            currentIndex: state.indexState,
            onTap: (index) {
              context
                  .read<NavBarIndexBottomBloc>()
                  .add(NavIndexEvent(indexEvent: index));
              Navigator.pushNamed(context, liste[index]);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(FluentSystemIcons.ic_fluent_search_regular),
                  activeIcon: Icon(FluentSystemIcons.ic_fluent_search_filled),
                  label: 'Recherche'),
              BottomNavigationBarItem(
                  icon: Icon(FluentSystemIcons.ic_fluent_ticket_regular),
                  activeIcon: Icon(FluentSystemIcons.ic_fluent_ticket_filled),
                  label: 'Ticket'),
              BottomNavigationBarItem(
                  icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
                  activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
                  label: 'Compte'),
            ]);
      },
    );
  }
}
