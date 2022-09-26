part of 'spotify_cubit.dart';

abstract class SpotifyState extends Equatable {
  const SpotifyState();

  @override
  List<Object> get props => [];
}

class SpotifyInitial extends SpotifyState {}

class SpotifyLoad extends SpotifyState {}

class SpotifyInit extends SpotifyState {}

class SpotifyError extends SpotifyState {}

class SpotifySucess extends SpotifyState {
  String topArtist;
  List<String> genres;
  SpotifySucess({required this.topArtist,required this.genres});
}
