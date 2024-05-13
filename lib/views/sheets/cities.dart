import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/cities/bloc.dart';

class CitiesSheet extends StatefulWidget {
  const CitiesSheet({Key? key}) : super(key: key);

  @override
  State<CitiesSheet> createState() => _CitiesSheetState();
}

class _CitiesSheetState extends State<CitiesSheet> {
  final bloc = GetIt.instance<CitiesBloc>()..add(GetCitiesEvent());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16,
          ),
          Text(
            "اختار مدينتك",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: BlocBuilder(
              bloc: bloc,
              builder: (context, state) {
                if (state is GetCitiesFailedState) {
                  return Text(state.msg);
                } else if (state is GetCitiesSuccessState) {
                  return ListView.separated(
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.pop(context, state.list[index]);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                            child: Text(state.list[index].name,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700))),
                      ),
                    ),
                    separatorBuilder: (context, index) => SizedBox(height: 16),
                    itemCount: state.list.length,
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
