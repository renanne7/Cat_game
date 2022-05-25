# Cat_game

A Description of the Game

The basic idea of the game is for the player to move around the board (shown in Figure 1) collecting letters
to form the word ‘cat’. The rules are as follows:

1. the players first move is to pick a randomly chosen square to start on (each square has the same
probability of being chosen as the starting square);

2. on each susequent turn, the player moves a number of steps, X, where X is a random variable with a
Poisson distribution with known parameter λ (if X = 0 then the player doesn’t physically move but
this still counts as a move);

3. when a player moves they can only move right, left, up or down and are equally likely to move in each
of these four directions;

4. if the player is to move more spaces than are available on the board in the specified direction, then they
stop at the final square available in that direction - for example if they start on B7 and are to move
four spaces to the right then they stop on B8 - if they start on F2 and are to move three squares down
then they stop on H2;

5. they can collect a copy of the letter from any square they land on (including the starting square)
provided they don’t already have that letter in their collection (i.e. they can have at most one of each
letter in their collection) - note that letters are not removed from squares, but a copy of the letter can
be colected;

6. the game ends when they have collected the letters “c”, “a” and “t” in any order;


This project was part of my MSc course from The University of Sheffield.
