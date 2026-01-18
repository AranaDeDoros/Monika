import std/unittest
import monika/japaneseutils
import monika/halfwidthconverter

suite "Monika Japanese String Utilities":

  setup:
    # This runs before every test (like 'before' in Scala)
    let hira = "こんにちは"
    let kata = "ハロー"

  test "detects hiragana correctly":
    check hira.hasHiragana == true
    check kata.hasHiragana == false

  test "converts to half-width":
    let full = "ハロー、ワールド！"
    check toHalfWidth(full) == "ﾊﾛｰ､ﾜｰﾙﾄﾞ!"

  test "monika wrapper logic":
    # Testing your JpnStr converter
    check "漢字".hasKanji == true