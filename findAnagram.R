# Anagram of a word that contain the same set of letters of a given word
# The letters in the anagram and in the word appear in different orders  
# 
# No word within the string can have an apostoph! 
# To avoid put a backward slash (\) before apostoph: world\'s <- world's 



findAnagram <- function(s){
   # Create a word list from s and hold it till the end
   w <- unlist( strsplit(s, " ") )

   # Normalize s and convert the normalized s to a word list
   s2 <- tolower(s)
   s2 <- gsub('\\-', '', s2)
   w2 <- unlist( strsplit(s2, " ") )
   d <- length(w2)
 
   # Sort letters in each word in w2 and put these in a new list, v
   v <- vector() 
   for (word in 1:d){
      x    <- unlist( strsplit(w2[word], "") )
      v[word] <- paste(sort(x), collapse="")
   }


   # Find the vector of duplicate words 
   dName <- v[ duplicated(v) ]
   # Find the vector of unique words 
   mName <- dName[!duplicated(dName)]       #similar: nName <- unique( dName )


   # Search the positions of the unique words in w 
   dim   <- length(mName)
   if (dim==0){ cat('No anagram found', '\n') }
   else{
      for (j in 1:dim){
      cat( w[ which(v %in% mName[j]) ], '\n')
      }
   }
}




# Run
s <- "top mop gun" 
findAnagram(s)

cat('  ',   '\n')

s <- "I may opt for a top yam for amy"
findAnagram(s)
