import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayState extends Equatable {

  final bool isGameOver;
  final String currentPlayer;
  final String winner;
  final int countWin1;
  final int countWin2;
  final int countDraw;
  final List<List<String>>? board;

  const PlayState({
    this.isGameOver = false,
    this.currentPlayer = 'X',
    this.winner = '',
    this.countDraw = 0,
    this.countWin1 = 0,
    this.countWin2 = 0,
    this.board
  });

  @override
  List<Object?> get props => [isGameOver, currentPlayer, winner, countWin1, countWin2, countDraw, board];

  PlayState copyWith({
    bool? isGameOver,
    String? currentPlayer,
    String? winner,
    int? countWin1,
    int? countWin2,
    int? countDraw,
    List<List<String>>? board
  }) {
    return PlayState(
      isGameOver: isGameOver ?? this.isGameOver,
      currentPlayer: currentPlayer ?? this.currentPlayer,
      winner: winner ?? this.winner,
      countWin1: countWin1 ?? this.countWin1,
      countWin2: countWin2 ?? this.countWin2,
      countDraw: countDraw ?? this.countDraw,
      board: board ?? this.board
    );
  }
}

class PlayCubit extends Cubit<PlayState> {
  PlayCubit() : super(const PlayState());

  void reset() {
    emit(state.copyWith(
      isGameOver: false,
      currentPlayer: 'X',
      winner: '',
      board: List.generate(3, (_) => List.filled(3, '')),
      countDraw: 0,
      countWin1: 0,
      countWin2: 0
    ));
  }

  void next() {
    if (state.isGameOver) {
      if (state.winner == 'X') {
        emit(state.copyWith(
            isGameOver: false,
            currentPlayer: 'X',
            winner: '',
            countWin1: state.countWin1+1,
          board: List.generate(3, (_) => List.filled(3, '')),
        ));
      } else if (state.winner == 'O') {
        emit(state.copyWith(
            isGameOver: false,
            currentPlayer: 'X',
            winner: '',
          countWin2: state.countWin2+1,
          board: List.generate(3, (_) => List.filled(3, '')),
        ));
      } else {
        emit(state.copyWith(
            isGameOver: false,
            currentPlayer: 'X',
            winner: '',
            countDraw: state.countDraw+1,
          board: List.generate(3, (_) => List.filled(3, '')),
        ));
      }
    }

  }

  void move(int row, int col) {
    final List<List<String>> newBoard = List.from(state.board as Iterable);

    if (newBoard[row][col].isEmpty && !state.isGameOver) {
      newBoard[row][col] = state.currentPlayer;
      final winner = check(newBoard);
      final currentPlayer = state.currentPlayer == 'X' ? 'O' : 'X';
      final isGameOver = winner.isNotEmpty || isFull(newBoard);
      emit(state.copyWith(
        board: newBoard,
        currentPlayer: currentPlayer,
        isGameOver: isGameOver,
        winner: winner,
      ));
    }

  }

  String check(List<List<String>> board) {
    for (int i = 0; i < 3; i++) {
      if (board[i][0].isNotEmpty && board[i][0] == board[i][1] && board[i][1] == board[i][2]) {
        return board[i][0];
      }
      if (board[0][i].isNotEmpty && board[0][i] == board[1][i] && board[1][i] == board[2][i]) {
        return board[0][i];
      }
    }
    if (board[0][0].isNotEmpty && board[0][0] == board[1][1] && board[1][1] == board[2][2]) {
      return board[0][0];
    }
    if (board[0][2].isNotEmpty && board[0][2] == board[1][1] && board[1][1] == board[2][0]) {
      return board[0][2];
    }
    return '';
  }

  bool isFull(List<List<String>> board) {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j].isEmpty) {
          return false;
        }
      }
    }
    return true;
  }
}