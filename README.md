# Monika (モニカ)

<p align="center"><img width="800" alt="monika" src="https://github.com/user-attachments/assets/4eb2421d-c0d2-4248-ab58-44d4c739914e" /></p>

Monika is a Japanese strings microlibrary for Nim. It provides a clean,
"implicit-style" API for handling characters, strings, and conversions. Ported from [JpnUtils](https://github.com/AranaDeDoros/JpnUtils).

## Features

- **Implicit Conversions:** Treat standard strings as Japanese objects via Nim converters.
- **Script Detection:** Easily check for Hiragana, Katakana, and Kanji.
- **Diacritics:** Detect Dakuten (voiced) and Handakuten (semi-voiced) marks.
- **Half-Width Conversion:** Efficiently convert between full-width and half-width forms.
- **Punctuation Wrappers:** Scala-style string wrapping for Japanese quotes.

---

## Installation

Add Monika to your .nimble file:

```nim
requires "monika >= 0.1.0"
```

Or install via command line:

```bash
nimble install https://github.com/AranaDeDoros/Monika
```

---

## Usage

Monika uses a converter to extend standard strings. Simply import Monika and start using the utility methods.

```nim
import monika/japaneseutils
import monika/punctuation
import monika/halfwidthconverter

if "こんにちは".hasHiragana:
  echo "Contains Hiragana!"

if "モニカ".hasKatakana:
  echo "Contains Katakana!"

if "学校".hasKanji:
  echo "Contains Kanji!"

# full-width to half-width
echo "ハロー、ワールド！".toHalfWidth
# Output: ﾊﾛｰ､ﾜｰﾙﾄﾞ!

# Check for voiced marks
if "が".hasDakuten:
  echo "This character is voiced."

let msg = "Hello"
echo msg.wrapInSingleQuotes # Output: 「Hello」
echo msg.wrapInDoubleQuotes # Output: 『Hello』

let s = "ガキ"
let h = "が".asRune()
let k = "エ".asRune()

if h.isSome:
  echo h.get.hiraToKata() # Output: カ
else:
  echo "empty string"

if k.isSome:
  echo k.get.kataToHira() # Output: え
else:
  echo "empty string"

let str = "日本語abcカナ"
echo str.containsOnly({Kanji, Katakana})  # false
let summary = str.scriptSummary()

echo summary.hiragana  # 0
echo summary.katakana  # 2
echo summary.kanji     # 3
echo summary.other     # 3
```

![Static Badge](https://img.shields.io/badge/version-1.0.0-blue.svg)
![Static Badge](https://img.shields.io/badge/license-MIT-red.svg)

---

## Test

```nim
nimble test
```

---

## Current modules

1. **monika/japaneseutils:** Core logic and string converters.
2. **monika/kanadiacritics:** Logic for voiced and semi-voiced marks.
3. **monika/punctuation:** Japanese-specific punctuation utilities.
4. **monika/halfwidthconverter:** Japanese-specific halfwidthconverter utilities.
