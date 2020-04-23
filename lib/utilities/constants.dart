library pianoscope_constants;

import 'package:pianoscope/models/song.dart';

const songs = <Song>[
  const Song('Upload song', 'Upload song', Difficulty.Easy),
  const Song('Fur Elise', 'Ludwig van Beethoven', Difficulty.Easy),
  const Song('Canon in D', 'Johann Pachelbel', Difficulty.Easy),
  const Song('Summer in \'20', 'Daniel Wiktorczyk', Difficulty.Easy),
  const Song('The Imperial March', 'John Williams', Difficulty.Easy),
  const Song('Let It Be', 'The Beatles', Difficulty.Medium),
  const Song('Moonlight Sonata', 'Ludwig van Beethoven', Difficulty.Medium),
  const Song('River Flows in You', 'Yiruma', Difficulty.Hard),
  const Song('Super Mario Bros. Overworld', 'Koji Kondo', Difficulty.Hard),
];

const notes = <String>['C', 'D', 'E', 'F', 'G', 'A', 'B'];

const accidentals = <String>['flat (\u266d)', 'normal (\u266e)', 'sharp (\u266f)'];

const chords = <String>[
  'Major',
  'Major 6th',
  'Major 7th',
  'Minor',
  'Minor 6th',
  'Minor 7th',
  'Dominant',
  'Dominant 7th',
  'Diminished',
  'Diminished 7th',
  'Augmented',
];

const scales = <String>[
  'Major (Ionian)',
  'Dorian',
  'Phrygian',
  'Lydian',
  'Mixolydian',
  'Minor (Aeolian)',
  'Locrian',
];
