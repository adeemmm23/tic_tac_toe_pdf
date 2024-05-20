# Tic Tac Toe PDF

There is one time, i was using pdf course from my professor and i noticed that he added button to move forward and backward in the pdf. I thought it will be funny to make a PDF game.

## Files

- `generator.py`: This generate all the possible combinations with the possible next move for each board in an ouput file `output.txt` that is formated in a VBA main.
- `output.txt`: VBA formated that you need to copy it to the script.bas file.
- `script.bas`: The script that will generate the game in the powerpoint.
- `ticTacToe.pptx`: Use the vba script here, i used PPTX instead of PPTM so i won't save the script there.
- `ticTacToe.pdf`: The final game :p

## How to Run

First Run the python script to generate VBA formatted Output.

```sh
python generator.py
```

Then copy the output to the `script.bas` file.

Then open the `ticTacToe.pptx` and run the script.
