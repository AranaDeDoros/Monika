#for handling simple punctuation
import std/strutils
func replacePunctuation*(str: string): string =
    str
    .multiReplace(
        (".", "。"),
        (",", "、"),
        ("?", "？"),
        ("!", "！"),
        ("(", "（"),
        (")", "）")
    )

func wrapInSingleQuotes*(str: string): string =
    "「" & str & "」"

func wrapInDoubleQuotes*(str: string): string =
    "『" & str & "』"
