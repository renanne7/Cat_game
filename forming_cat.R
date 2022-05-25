##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### #####

## 1
# Create a matrix for the letter grid
lgrid <- matrix(NA, nrow = 8, ncol = 8) 
lgrid[1,] <- c("r", "l", "q", "s", "t", "z", "c", "a") 
lgrid[2,] <- c("i", "v", "d", "z", "h", "l", "t", "p") 
lgrid[3,] <- c("u", "r", "o", "y", "w", "c", "a", "c") 
lgrid[4,] <- c("x", "r", "f", "n", "d", "p", "g", "v") 
lgrid[5,] <- c("h", "j", "f", "f", "k", "h", "g", "m") 
lgrid[6,] <- c("k", "y", "e", "x", "x", "g", "k", "i") 
lgrid[7,] <- c("l", "q", "e", "q", "f", "u", "e", "b") 
lgrid[8,] <- c("l", "s", "d", "h", "i", "k", "y", "n")

# Function to find the starting position and move counter
start_pos <- function(){
  # Generate a random starting position
  start_sq_x <- sample(x = 1:8, size = 1)
  start_sq_y <-sample(x = 1:8, size = 1)
  start_sq <- c(start_sq_x, start_sq_y)
  cat("start at square = ", start_sq, "\n")
  return(start_sq)
}

make_move <- function(start_sq, lambda){
  # Random pois variable to choose the number of steps
  X <- rpois(1, lambda = lambda)
  cat("Randon poisson", X, "\n")
  
  # Generate random number between 1 and 4 for type of movement
  movement <- c("up", "down", "left", "right")
  move_type <- sample(x = 1:4, size = 1)
  cat("Move type", move_type, "\n")
  
  # Compute the new position
  if(move_type == 1 && (start_sq[1] - X) > 0){
    next_sq <- c(start_sq[1] - X, start_sq[2])
  }else 
    if(move_type == 1 && (start_sq[1] - X) <= 0){
      next_sq <- c(1, start_sq[2])
    }else
      if(move_type == 2 && (start_sq[1] + X) < 9){
        next_sq <- c(start_sq[1] + X, start_sq[2])
      }else
        if(move_type == 2 && (start_sq[1] + X) >= 9){
          next_sq <- c(8, start_sq[2])
        }else
          if(move_type == 3 && (start_sq[2] - X) > 0){
            next_sq <- c(start_sq[1], start_sq[2] - X)
          }else
            if(move_type == 3 && (start_sq[2] - X) <= 0){
              next_sq <- c(start_sq[1], 1)
            }else
              if(move_type == 4 && (start_sq[2] + X) < 9){
                next_sq <- c(start_sq[1], start_sq[2] + X)
              }else
                if(move_type == 4 && (start_sq[2] + X) >= 9){
                  next_sq <- c(start_sq[1], 8)
                }
  cat("Next sq", next_sq, "\n")
  return(next_sq)
}

##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### #####

## 2
count_num_moves <- function(lambda){
  num_moves <- 1
  finished_game = FALSE
  letters_vector <- character()
  
  # Get starting position and the first letter
  start_sq <- start_pos()
  next_sq <- start_sq
  letters_vector <- append(letters_vector, lgrid[next_sq[1], next_sq[2]])
  
  while(finished_game == FALSE){
    num_moves <- num_moves + 1
    
    # Get the next position and the corresponding letter
    next_sq <- make_move(next_sq, lambda)
    letters <- lgrid[next_sq[1], next_sq[2]]
    
    # Append letters to the letter vector if not already present in the letter vector
    if(!any(letters == letters_vector)){
      letters_vector <- append(letters_vector, letters)
    }
    
    # Check if the letter vector has c, a and t
    if(('c' %in% letters_vector) && ('a' %in% letters_vector) && ('t' %in% letters_vector)){
      finished_game = TRUE
      }
  }
  
  cat(letters_vector, "\n")
  return(num_moves)
}

num_moves <- count_num_moves(lambda = 1)
cat("number of moves", num_moves, "\n")

##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### #####

## 3

# replicate the function m times for lambda = 1
probability_estimates <- replicate(100000, expr = count_num_moves(lambda = 1))
# plot the probability distribution for number of moves required
hist(probability_estimates, main="Histogram of distribution of number of moves to finish the game, lambda = 1", xlab="dist_num_of_moves")
mean(probability_estimates)

# replicate the function m times for lambda = 4
probability_estimates <- replicate(100000, expr = count_num_moves(lambda = 4))
# plot the probability distribution for number of moves required
hist(probability_estimates, main="Histogram of distribution of number of moves to finish the game, lambda = 4", xlab="dist_num_of_moves")
mean(probability_estimates)

##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### #####

## 4
count_num_moves_modified <- function(lambda){
  num_moves <- 1
  finished_game = FALSE
  letters_vector <- character()
  alphabets_vector <- c('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 
                        'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z')
  
  # Get starting position and the first letter incremented by 1
  start_sq <- start_pos()
  next_sq <- start_sq
  letters_vector <- append(letters_vector, lgrid[next_sq[1], next_sq[2]])
  
  while(finished_game == FALSE){
    
    # If green square, change the letter vector by replacing each character with the next character
    if((next_sq[1]=='2' && next_sq[2]=='6') || (next_sq[1]=='3' && next_sq[2]=='7')){
      incremented_letters_vector <- character()
      for(char in letters_vector){
        if(char != 'z'){
          c <- match(char, alphabets_vector)
          incremented_letters_vector <- append(incremented_letters_vector, alphabets_vector[c + 1])
        }else{
          incremented_letters_vector <- append(incremented_letters_vector, 'a')
        }
      }
      letters_vector <- incremented_letters_vector
    }
    
    if(('c' %in% letters_vector) && ('a' %in% letters_vector) && ('t' %in% letters_vector)){
      finished_game = TRUE
    } else{
      next_sq <- make_move(next_sq, lambda)
      letters <- lgrid[next_sq[1], next_sq[2]]
      if(!any(letters == letters_vector)){
        letters_vector <- append(letters_vector, letters)
      }
    }
    num_moves <- num_moves + 1
  }
  return(num_moves)
}
num_moves <- count_num_moves_modified(lambda = 1)
cat("number of moves", num_moves, "\n")

##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### #####

## 5

# replicate the function m times for lambda = 1
probability_estimates <- replicate(100000, expr = count_num_moves_modified(lambda = 1))
# plot the probability distribution for number of moves required
hist(probability_estimates, main="Histogram of distribution of number of moves to finish the game, lambda = 1", xlab="dist_num_of_moves")
mean(probability_estimates)

##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### #####