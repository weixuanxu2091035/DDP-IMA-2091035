"""
Write a function that will take in a string parameter
and return a string in its equivalent Morse code.
"""
def morse_code(word):
    letter = {
        'a': '.-', 'b': '-...', 'c': '-.-.', 'd': '-..', 'e': '.',
        'f': '..-.', 'g': '--.', 'h': '....', 'i': '..', 'j': '.---',
        'k': '-.-', 'l': '.-..', 'm': '--', 'n': '-.', 'o': '---',
        'p': '.--.', 'q': '--.-', 'r': '.-.', 's': '...', 't': '-',
        'u': '..-', 'v': '...-', 'w': '.--', 'x': '-..-', 'y': '-.--', 'z': '--..',
        '0': '-----', '1': '.----', '2': '..---', '3': '...--', '4': '....-',
        '5': '.....', '6': '-....', '7': '--...', '8': '---..', '9': '----.',
        '.': '·-·-·-', ',': '--··--'
    }
    word = word.lower()
    morsec = []
    for item in word:
        if item == ' ':
            morsec.append(' ')
        else:
            morsec.append(letter[item])
    print(' '.join(morsec))



"""
Write a function that takes in a string parameter and 
returns a list and a count of the unique letters in the 
string. (Uppercase and lowercase letters should not be 
counted as different letters and symbols should be ignored.)
"""
def unique_letters (word):
    letter = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    word = word.upper()
    word_list = []
    for item in word:
        if item not in word_list and item in letter:
            word_list.append(item)
    print(word_list, ',', len(word_list))



morse_code("Hello world")

unique_letters("Hello world")