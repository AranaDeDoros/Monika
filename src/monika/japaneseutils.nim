import std/unicode, std/sequtils
import punctuation, kanadiacritics
export punctuation, kanadiacritics

const
  HIRAGANA_LOWER* = 0x3040
  HIRAGANA_UPPER* = 0x309F

  KATAKANA_LOWER* = 0x30A0
  KATAKANA_UPPER* = 0x30FF

  KANJI_LOWER*    = 0x4E00
  KANJI_UPPER*    = 0x9FAF

# char utilities
proc isHiragana*(c: Rune): bool =
  let asInt = c.int
  asInt >= HIRAGANA_LOWER and asInt <= HIRAGANA_UPPER

proc isKatakana*(c: Rune): bool =
  let asInt = c.int
  asInt >= KATAKANA_LOWER and asInt <= KATAKANA_UPPER

proc isKanji*(c: Rune): bool =
  let asInt = c.int
  asInt >= KANJI_LOWER and asInt <= KANJI_UPPER

# string utilities
proc containsHiragana*(s: string): bool =
  for r in s.runes:
    if isHiragana(r): return true
  false

proc containsKatakana*(s: string): bool =
  for r in s.runes:
    if isKatakana(r): return true
  false

proc containsKanji*(s: string): bool =
  for r in s.runes:
    if isKanji(r): return true
  false

proc containsDakuten*(s: string): bool =
  kanadiacritics.hasDakuten(s)

proc containsHandakuten*(s: string): bool =
  kanadiacritics.hasHandakuten(s)

# wrapper
type
  JpnStr* = object
    value: string

converter toJpn*(s: string): JpnStr =
  JpnStr(value: s)

proc hasHiragana *(js: JpnStr): bool =
  containsHiragana(js.value)

proc hasKatakana *(js: JpnStr): bool =
  containsKatakana(js.value)

proc hasKanji*(js: JpnStr): bool =
  containsKanji(js.value)

proc hasDakuten*(js: JpnStr): bool =
  containsDakuten(js.value)

proc hasHandakuten*(js: JpnStr): bool =
  containsHandakuten(js.value)

proc wrapInSingleQuotes*(js: JpnStr): string =
  punctuation.wrapInSingleQuotes(js.value)

proc wrapInDoubleQuotes*(js: JpnStr): string =
  punctuation.wrapInDoubleQuotes(js.value)
