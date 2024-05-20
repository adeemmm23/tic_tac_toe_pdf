# Tic Tac Toe PDF

There was one time, i was using pdf course from my professor and i noticed that he added button to move forward and backward in the pdf.
I thought it will be funny to make a PDF game out of this behavior.
And here we are :D

## Files

- `generator.py`: This script will generate all the possible boards with the possible next move for each board in an output file `output.txt` that is formated in a VBA script.
- `output.txt`: VBA formated file that you will need to copy to the `script.bas` file.
- `script.bas`: The script that will generate the game in the powerpoint.
- `ticTacToe.pptx`: Use the vba script here, i used PPTX instead of PPTM so it won't save the script.
- `ticTacToe.pdf`: The final game :p

## How to Run

First Run the python script to generate `output.txt` file.

```powershell
python generator.py
```

Then copy the output to the `script.bas` file.

```powershell
cat output.txt >> script.bas
```

Then open the `ticTacToe.pptx` and run the script.

## Problems

Originally, i was going to make the game with VBA only but it was slow and memory unefficient, [with each sub has limit to it's memory.](https://learn.microsoft.com/en-us/office/vba/language/concepts/getting-started/creating-recursive-procedures)
Since, i had to do it in recursive way, and PowerPoint keep crushing, so i moved to python.

Also, in vba i was going to make only the main but [VBA's sub can't handle large codes](https://stackoverflow.com/questions/3751263/procedure-too-large).

## Note

I really hate VBA, and also i can't wrap my head arround pythonic's codes.
