how does a text editor work?

Fundamentally, there is a "screen", which is an empty data structure (perhaps an array with space characters, etc).

There are four operations:
1. Type a character/seq of chars
2. Type a "negative seq of chars"/Backspace
3. Move the cursor around using the arrow keys to highlight text you are looking at.
4. Save/write the file out.

How do we:
1. Allow the user to type a sequence of characters?
2. Allow the user to backspace/delete characters?
3. Move the cursor around using the arrow keys?
4. Save/write the file out?