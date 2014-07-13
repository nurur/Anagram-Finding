# Anagram of a word that contain the same set of letters of a given word
# The letters in the anagram and in the word appear in different orders  
# 
# No word within the string can have an apostoph! 
# To avoid put a backward slash (\) before apostoph: world\'s <- world's 


def findAnagram(s):
    w  = s.split()  #split string the s into words and save

    s2 = s.lower()  #normalize s to s2 for general case. 
    w2 = s2.split() #split normalized string s2 into list of words, w2


    # Sort letters in each word in w2 and put each sorted word in a new list ls
    ls = [''.join(sorted( list(w2[word]) )) for word in range( len(w2) )]

    # From ls, find the list of unique words
    ld = list( set([i for i in ls if ls.count(i) > 1]) )


    # Find the positions of the words in the list that are anagrams
    count=0                                # count for no anagram
    for i in range(len(ld)):
        mName=[]
        for j in range(len(ls)):
            if ld[i]==ls[j]:
                mName.append(j)
                count=count+1
        print [w[k] for k in mName]        # print anagrams in s (in w)

    # case for no anagram
    if (count == 0): print 'No anagram found!'



# Run
s="top mop gun" 
findAnagram(s)

print '   '

s="I may opt for a top yam for amy"
findAnagram(s)
