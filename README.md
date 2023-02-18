# tic_tac_toe
18.02.2023:

Tic Tac Toe has reached v1.0. The gameloop is embedded in an exitable main-loop.
Possible ToDos: 
- Tidying up the output
- Tidying up the code
- Optimizing the code
- Additional game modes (PvC, CvC)
- Help mode
- Scorekeeping

Learned/Trained:
- Preplanning
- Encapsulation

The game was implemented using the preplanned structure: 3 classes and 1 module. Some classes and the module had to be expanded to store additional data / better control the program flow, but the main design  and the main tasks of each class stayed the same.
This encapsulation allowed me to test differend parts of the programm individually. It also leads to the code being easier to maintain. 
Comparing this to the initial idea of the Board-class being responsible for the enforcing the game rules and the program flow, dividing the tasks means the program is much more intuitive and readable.


17.02.2023:

Tic Tac Toe is planned to be contain 3 classes and a module

class Player:   Instances of this class represent a player. 
                It can store a name and a sign.
                It contains a method to get a players next move.

class Board:    Instances of this class represent the game state.
                It can store the game state.
                It contains methods to draw the board and to update the game state.

class GM:       Instances of this class are used to direct the program flow.
                It can store references to the players and the board.
                It contains the game's main logic.

module Rules:   This module is used to represent the game rules.
                It contains a method to check a move's validity.
                It contains a method to check if a given board state has a winner.