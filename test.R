lgrid <- matrix(NA, nrow = 8, ncol = 8) 
lgrid[1,] <- c("r", "l", "q", "s", "t", "z", "c", "a") 
lgrid[2,] <- c("i", "v", "d", "z", "h", "l", "t", "p") 
lgrid[3,] <- c("u", "r", "o", "y", "w", "c", "a", "c") 
lgrid[4,] <- c("x", "r", "f", "n", "d", "p", "g", "v") 
lgrid[5,] <- c("h", "j", "f", "f", "k", "h", "g", "m") 
lgrid[6,] <- c("k", "y", "e", "x", "x", "g", "k", "i") 
lgrid[7,] <- c("l", "q", "e", "q", "f", "u", "e", "b") 
lgrid[8,] <- c("l", "s", "d", "h", "i", "k", "y", "n")

start_sq_x <- sample(x = 1:8, size = 1)
start_sq_y <-sample(x = 1:8, size = 1)
start_sq <- c(start_sq_x, start_sq_y)
cat("start at square = ", start_sq, "\n")
next_sq <- start_sq

X <- rpois(1, lambda = 2)
cat(X, "\n")

movement <- c("up", "down", "left", "right")
move_type <- sample(x = 1:4, size = 1)
cat(move_type, "\n")

if(move_type == 1 && (start_sq[1] - X) > 0){
  next_sq <- c(start_sq[1] - X, start_sq[2])
  cat(next_sq, "\n")
}else 
  if(move_type == 1 && (start_sq[1] - X) <= 0){
    next_sq <- c(1, start_sq[2])
    cat(next_sq, "\n")
  }else
    if(move_type == 2 && (start_sq[1] + X) < 9){
      next_sq <- c(start_sq[1] + X, start_sq[2])
      cat(next_sq, "\n")
    }else
      if(move_type == 2 && (start_sq[1] + X) >= 9){
        next_sq <- c(8, start_sq[2])
        cat(next_sq, "\n")
      }else
        if(move_type == 3 && (start_sq[2] - X) > 0){
          next_sq <- c(start_sq[1], start_sq[2] - X)
          cat(next_sq, "\n")
        }else
          if(move_type == 3 && (start_sq[2] - X) <= 0){
            next_sq <- c(start_sq[1], 1)
            cat(next_sq, "\n")
          }else
            if(move_type == 4 && (start_sq[2] + X) < 9){
              next_sq <- c(start_sq[1], start_sq[2] + X)
              cat(next_sq, "\n")
            }else
              if(move_type == 4 && (start_sq[2] + X) >= 9){
                next_sq <- c(start_sq[1], 8)
                cat(next_sq, "\n")
              }
cat(next_sq, "\n")

letters_vector <- character()
letters <- lgrid[next_sq[1], next_sq[2]]

letters_vector <- append(letters_vector, letters)
cat(letters_vector, "\n")

if(('c' %in% letters_vector) && ('a' %in% letters_vector) && ('t' %in% letters_vector)){
  cat("trueeeeeeeeeeeeeeeeeeee", "\n")
}
