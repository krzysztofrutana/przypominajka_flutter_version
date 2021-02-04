import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:przypominajka_flutter/pages/drawer/bloc/drawer_bloc.dart';


main() {
  group("Navigation method tests", (){
    blocTest<DrawerBloc, DrawerState>(
        'Emits [NavDrawerState] when NavigateTo(NavItem.page_five) is added',
        build: ()  => DrawerBloc(),
        act: (bloc) async => bloc.add(NavigateTo(NavigationItem.event_list)),
        expect: [isA<DrawerState>()],
        verify: (bloc) async {
          expect(bloc.state.selectedItem, NavigationItem.event_list);
        });
  });

}