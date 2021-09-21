abstract class Musicians {
  void myMusicIsTheBest();
}

mixin GuitarPlay {
  void solo() {
    print("GUITAAAAAAAAR\nBryn-bryn-bryn\n");
  }
}

mixin TrumpetPlay {
  void highNote() {
    print("TRUMPEEEET\nPwwwwwwwwwwww\n");
  }
}

class RockPlayer extends Musicians with GuitarPlay {
  void myMusicIsTheBest() {
    solo();
  }
}

class JazzPlayer extends Musicians with TrumpetPlay {
  void myMusicIsTheBest() {
    highNote();
  }
}

class TwoManBand extends Musicians with GuitarPlay, TrumpetPlay {
  void myMusicIsTheBest() {
    solo();
    highNote();
    print("\nYUHUUUUUUUUUU\n");
  }
}
