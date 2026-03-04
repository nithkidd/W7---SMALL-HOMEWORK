import '../../../../model/songs/song.dart';
import 'package:flutter/material.dart';
import '../../../../data/repositories/songs/song_repository.dart';
import '../../../states/player_state.dart';

class LibraryViewModel extends ChangeNotifier {
  // needed param for
  final SongRepository songRepository;
  final PlayerState playerState;
  LibraryViewModel({required this.songRepository, required this.playerState});

  List<Song> _songs = [];

  // 1- Fetch songs from the repository
  List<Song> get songs => _songs;

  void init() {
    _songs = songRepository.fetchSongs();
    notifyListeners();
  }

  //check current play song
  bool isPlaying(Song song) {
    return playerState.currentSong == song;
  }

  // user action

  //play song
  void playSong(Song song) {
    playerState.start(song);
    notifyListeners();
  }

  //stop song
  void stopSong(Song song) {
    playerState.stop();
    notifyListeners();
  }

  //toggle the song play or stop
  void toggleSong(Song song) {
    isPlaying(song) ? stopSong(song) : playSong(song);
  }
}
