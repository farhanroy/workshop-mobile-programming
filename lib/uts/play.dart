import 'dart:isolate';

import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neon_widgets/neon_widgets.dart';

import 'play_cubit.dart';

class Play extends StatelessWidget {
  const Play({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => PlayCubit()..reset(),
      child: const _PlayView(),
    );
  }
}

class _PlayView extends StatelessWidget {
  const _PlayView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<PlayCubit, PlayState>(
      listener: (context, state) {
        if (state.isGameOver) {
          showDialog<void>(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext ctx) {
                return AlertDialog(
                  title: const Text('Permainan Berakhir'),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: const <Widget>[
                        Text('Apakah anda ingin melanjutkan permainan ?'),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(color: Colors.red),
                      ),
                      onPressed: () {
                        context.read<PlayCubit>().reset();
                        Navigator.of(context).pop();
                      },
                      child: const Text('Reset'),
                    ),
                    TextButton(
                      child: const Text('Lanjut'),
                      onPressed: () {
                        context.read<PlayCubit>().next();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              });
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 100,),
                _Announce(),
                const SizedBox(height: 80,),
                _Board()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Announce extends StatelessWidget {
  const _Announce({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayCubit, PlayState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildText(
                state.countWin1.toString(),
                'Player 1 (X)',
              ),

              _buildText(
                state.countDraw.toString(),
                'Draw',
              ),

              _buildText(
                state.countWin2.toString(),
                'Player 2 (O)',
              ),

            ],
          );
        });
  }
  Widget _buildText(String value, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        NeonText(
          text: value,
          spreadColor: Colors.pink,
          blurRadius: 20,
          textSize: 36,
          textColor: Colors.white,
        ),
        NeonText(
          text: label,
          spreadColor: Colors.pink,
          blurRadius: 20,
          textSize: 18,
          textColor: Colors.white,
        ),
      ],
    );
  }
}


class _Board extends StatelessWidget {
  const _Board({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<PlayCubit, PlayState>(
        builder: (context, state) {
          final List x = Iterable<int>.generate(state.board!.length).toList();
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: x.map((idx) {
              final List y = Iterable<int>.generate(state.board![idx].length).toList();
              return Column(
                children: y.map((idy) {
                  return GestureDetector(
                    onTap: () {
                        FlameAudio.play('click-tone.wav').then((_) {
                          context.read<PlayCubit>().move(idx, idy);
                        });
                    },
                    child: NeonContainer(
                      width: 95,
                      height: 95,

                      child: Center(
                          child: NeonText(
                              text: state.board![idx][idy],
                            spreadColor: Colors.pink,
                            blurRadius: 20,
                            textSize: 65,
                            textColor: Colors.white,
                          )
                      ),
                    ),
                  );
                }).toList(),
              );
            }).toList(),
          );
        }
    );
  }
}



