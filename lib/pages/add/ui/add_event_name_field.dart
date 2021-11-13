import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:przypominajka_flutter/pages/add/bloc/add_bloc.dart';
import 'package:przypominajka_flutter/pages/add/bloc/add_event_name_bloc.dart';

class AddEventNameField extends StatefulWidget {
  @override
  _AddEventNameFieldState createState() => _AddEventNameFieldState();
}

class _AddEventNameFieldState extends State<AddEventNameField> {

  final _eventNameController = TextEditingController();
  AddEventNameBloc _addEventNameBloc;

  @override
  void dispose() {
    _eventNameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    this._addEventNameBloc = BlocProvider.of<AddEventNameBloc>(context);
    ;
    super.initState();
  }

  UnderlineInputBorder _renderBorder(AddEventNameState state) =>
      UnderlineInputBorder(
        borderSide: BorderSide(
            color: _hasNameError(state) ? Colors.red : Colors.black,
            width: 1),
      );

  bool _hasNameError(AddEventNameState state) {
    if (state == IsOk() || state == Initialize()) {
      return false;
    } else {
      return true;
    }
  }

  String _nameErrorText(String text) {
    switch (text) {
      case 'empty':
        return 'Wpisz nazwę';
      case 'incorrect':
        return 'Nazwa zajęta lub nieprawidłowa';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: _addEventNameBloc,
        child: BlocBuilder<AddEventNameBloc, AddEventNameState>(
            builder: (context, state) {
              if (state == IsBusy()) {
                return CircularProgressIndicator();
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: _eventNameController,
                    style: TextStyle(
                      color: (state == IsOk() || state == Initialize())
                          ? Colors.black
                          : Colors.red,
                    ),
                    decoration: InputDecoration(
                      hintText: 'wpisz nazwę',
                      labelStyle: TextStyle(
                        color: (state == IsOk() || state == Initialize())
                            ? Colors.black
                            : Colors.red,
                      ),
                      hintStyle: TextStyle(
                        color: (state == IsOk() || state == Initialize())
                            ? Colors.black
                            : Colors.red,
                      ),
                      enabledBorder: this._renderBorder(state),
                      focusedBorder: this._renderBorder(state),
                    ),
                    onChanged: (text) {
                      if(text != null) {
                        _addEventNameBloc.add(EventNameChanged(text));
                      }
                    },
                  ),
                  if(state != IsOk() && state != Initialize() && state != IsEmpty()) ...[
                    SizedBox(height: 5),
                    Text(
                      this._nameErrorText('incorrect'),
                      style: TextStyle(color: Colors.red),
                    ),
                  ],

                  if(state == IsEmpty()) ...[
                    SizedBox(height: 5),
                    Text(
                      this._nameErrorText('empty'),
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                  SizedBox(height: 30),
                  RaisedButton(
                      child: Text('Zapisz'),
                      onPressed: () {})
                ],
              );
            }));
  }
}
