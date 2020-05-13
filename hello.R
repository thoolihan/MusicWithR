library(audio)
library(music)
library(ggplot2)

help(package=music)
help(package=audio)

# play a scale
buildScale("C4", "major", plot=TRUE, play=TRUE)

# build a chord
buildChord(root="C4", chord="major", plot=TRUE, play=TRUE)

# play a simple chord progression
# ii - V7 - I, common in jazz
buildChord(root="A4", chord="minor", plot=TRUE, play=TRUE)
buildChord(root="G4", chord="7th", plot=TRUE, play=TRUE)
buildChord(root="C4", chord="major", plot=TRUE, play=TRUE)

# build a major progression
buildProgression(root="C4", scale="major", play=TRUE, plot=TRUE)

# build a minor progression
buildProgression(root="A4", scale="minor", play=TRUE, plot=TRUE)

# plot piano notes, used by above
example(cplot.piano) # <- run example from help file ?cplot.piano

# frequency plot of an 1/8th note, middle C (C4)
middle_c <- note2freq(note = "C4")
freq2wave(middle_c, oscillator = "sine", duration = 0.25, plot = TRUE, play=TRUE)

# helper function to simplify syntax of vectors of notes
cmaj7 <- strings("C4 E4 G4 B4 C5")
cmaj7

# note distance, semitones between elements of chord
noteDistance(cmaj7)

# plot frequencies
plot_freq_chord <- function(notes) {
  #y <- note2freq(notes)
  #barplot(x = notes, y = y)
  notes <- factor(notes, levels = notes)
  freqs <- note2freq(notes) 
  print(freqs)
  ggplot(mapping = aes(x = notes, y = freqs)) +
    geom_point() +
    ylim(0, max(freqs)) +
    geom_abline(slope=0) # fix
}

plot_freq_chord(cmaj7)

# examine a chord in totality
disect_chord <- function(notes) {
  print(note2freq(notes))
  writeLines(" ")
  print(diff(note2freq(notes)))
  writeLines(" ")
  print(noteDistance(notes))
  writeLines(" ")
  cplot.piano(notes)
  writeLines(" ")
  plot_freq_chord(notes)
}

disect_chord(cmaj7)

