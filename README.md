# tic_tac_toe
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