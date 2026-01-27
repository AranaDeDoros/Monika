import std/unittest
import monika/japaneseutils
import monika/halfwidthconverter

suite "Monika Japanese String Utilities":

  setup:
    let hira = "こんにちは"
    let kata = "ハロー"

  test "detects hiragana correctly":
    check hira.hasHiragana == true
    check kata.hasHiragana == false

  test "converts to half-width":
    let full = "ハロー、ワールド！"
    check toHalfWidth(full) == "ﾊﾛｰ､ﾜｰﾙﾄﾞ!"

  test "monika wrapper logic":
    check "漢字".hasKanji == true

  test "contains only works correctly":
    let str1 = "カタカナ"
    let str2 = "カタカナ漢字"
    check str1.containsOnly({Katakana}) == true
    check str2.containsOnly({Katakana}) == false

  test "hiragana to katakana":
    let hiraStr = "あいうえお"
    let kataStr = hiraStr.hiraToKata()
    check kataStr == "アイウエオ"

   test "katakana to hiragana":
    let kataStr = "アイウエオ"
    let hiraStr = kataStr.kataToHira()
    check hiraStr == "あいうえお"

  test "script summary works correctly":
    let mixedStr = "あいうカナ漢字abc"
    let summary = mixedStr.scriptSummary()
    check summary.hiragana == 3
    check summary.katakana == 2
    check summary.kanji == 2
    check summary.other == 3