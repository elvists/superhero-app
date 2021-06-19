import 'package:flutter/material.dart';
import 'package:superhero/bloc/superhero/superhero_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superhero/bloc/superhero/superhero_event.dart';
import 'package:superhero/bloc/superhero/superhero_state.dart';
import 'package:superhero/components/error_screen.dart';
import 'package:superhero/model/superhero.dart';

import 'components/detail_page_body.dart';
import 'components/detail_page_header.dart';

class DetailContainer extends StatelessWidget {
  final int id;

  const DetailContainer({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SuperheroBloc(),
      child: _DetailScreen(id: id),
    );
  }
}

class _DetailScreen extends StatefulWidget {
  final int id;

  const _DetailScreen({Key key, this.id}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<_DetailScreen> {
  @override
  void initState() {
    _loadSuperhero();
    super.initState();
  }

  void _loadSuperhero() =>
      context.read<SuperheroBloc>().add(SuperheroFetchEvent(id: widget.id));

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocBuilder<SuperheroBloc, SuperheroState>(
          builder: (context, state) {
            if (state is SuperheroErrorState) {
              return ErrorScreen(retry: _loadSuperhero);
            }
            if (state is SuperheroFetchedState) {
              return _buildScreen(state.superhero);
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      );

  Scaffold _buildScreen(Superhero superhero) => Scaffold(
        body: CustomScrollView(slivers: [
          DetailPageHeader(imageUrl: superhero.images.lg, name: superhero.name),
          DetailPageBody(superhero: superhero),
        ]),
      );
}
