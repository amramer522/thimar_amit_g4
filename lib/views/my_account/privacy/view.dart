import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get_it/get_it.dart';
import 'package:thimar_amit_g4/core/logic/helper_methods.dart';
import 'package:thimar_amit_g4/features/my_account/privacy/bloc.dart';

class PrivacyView extends StatefulWidget {
  const PrivacyView({Key? key}) : super(key: key);

  @override
  State<PrivacyView> createState() => _PrivacyViewState();
}

class _PrivacyViewState extends State<PrivacyView> {
  final bloc = GetIt.I<PrivacyBloc>()..add(GetPrivacyEvent());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder(
                   bloc: bloc,
                   builder: (context, state) {
                     if (state is GetPrivacyFailedState) {
                       return Text(state.msg);
                     } else if (state is GetPrivacySuccessState) {
                       return Html(data: state.model.policy);
                     } else {
                       return Center(child: CircularProgressIndicator(),);
                     }
                   },
                 ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openUrl("https://wa.me/201012765745?text=Hello");
        },
        child: Text("Call"),
      ),
    );
  }
}
