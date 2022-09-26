import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bloc_custom_firebase/env.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:oauth2_client/oauth2_helper.dart';
import 'package:oauth2_client/spotify_oauth2_client.dart';

part 'spotify_state.dart';

class SpotifyCubit extends Cubit<SpotifyState> {
  SpotifyCubit() : super(SpotifyInitial());
  List<String> genres = [];
  void printWrapped(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  void connectToSpotify() async {
    emit(SpotifyLoad());
    try {
      var helper = OAuth2Helper(
          SpotifyOAuth2Client(
              customUriScheme: 'com.shashi.ecstacy',
              redirectUri: ENV.redirectUri),
          clientId: ENV.clientId,
          grantType: OAuth2Helper.authorizationCode,
          clientSecret: ENV.clientSecret,
          scopes: ENV.scopes);

      try {
        Response response = await helper.get(
            "https://api.spotify.com/v1/me/top/artists?limit=5&time_range=medium_term");
        var map = jsonDecode(response.body)["items"];
        genres = getGenres(map);

        //name,genres

        emit(SpotifySucess(topArtist: map[0]["name"], genres: genres));
      } catch (e) {
        print(e.toString());
        emit(SpotifyError());
      }
    } catch (e) {
      print(e.toString());
      emit(SpotifyError());
    }
  }

  List<String> getGenres(map) {
    List<dynamic> genres = [];
    for (var submap in map) {
      genres.addAll(submap["genres"]);
    }
    return List<String>.from(genres).toSet().toList();
  }
}
