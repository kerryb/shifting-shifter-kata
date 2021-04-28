# Shifting shift cipher

You must write a program which will DECRYPT a shifting shift cipher. Here are
the rules for encrypting, and from those you can work out how to decrypt.

A normal shift cipher moves letters by a fixed amount. E.g. With a shift of 2:
A becomes C, B becomes D, C becomes E, etc.

A shifting shift cipher changes the shift number as you go, so for encrypting,
encrypt one letter at a time, and adjust the shift number as required. It
should only require one pass through the message.

To encrypt:

1. Take the first letter of the message, and do not encrypt it. Just pass it
   on. But, it will give you the initial shift for the next letter(s). E.g. If
   the first letter is 'A', then you must shift subsequent letters by 1. If
   it's 'B', then shift by 2.
2. When you encounter a vowel, shift it by the same number of characters as you
   would otherwise, but then increase the shift amount by 1 for subsequent
   letters.

Please also note

1. Case remains unchanged. Spaces remain unchanged. Punctuation remains
   unchanged. Digits remain unchanged.
2. The alphabet loops (so incrementing 'y' by 3 gets you to 'b').
3. If the first letter is a vowel, then this simply determines the starting
   shift value, and does not automatically increment it. (e.g. 'A' results in
   the next letter being shifted by 1, not 2.)
4. If the first character is not a letter, then copy them straight through, and
   shifting simply starts when the first letter is reached.

## Worked encrypting example

"This is a test." = (We keep the first letter, T, which is letter number 20, so
we shift subsequent letters by 20: 'h' becomes 'b' (it looped round the end of
the alphabet), 'i' becomes 'c'. As 'i' is a vowel, we now increase the shift
value to 21. 's' becomes 'n', 'i' becomes 'd', and as 'I' is a vowel, we
increase our shifter to 22. 's' becomes 'o'. etc.) = "Tbcn do w qbqr."

# Other encryption examples

    "abcdefg" => "acdefhi"
    "Santa says 'ho ho ho'" => "Sthnu nvuo 'dk el fm'"
    "12 Days Of Easter" => "12 Dedx Tl Khabma"
