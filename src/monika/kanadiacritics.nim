#to detect dakuten and handakuten
import normalize
import std/unicode
import std/sequtils

const
  Dakuten: Rune    = Rune(0x3099)
  Handakuten: Rune = Rune(0x309A)

proc hasDakuten*(s: string): bool =
  let norm = toNfd(s)
  for r in norm.toRunes():
    if r == Dakuten:
      return true
  false

proc hasHandakuten*(s: string): bool =
  let norm = toNfd(s)
  for r in norm.toRunes():
    if r == Handakuten:
      return true
  false

proc hasAny*(s: string): bool =
  let norm = toNfd(s)
  for r in norm.toRunes():
    if r == Dakuten or r == Handakuten:
      return true
  false
