import re

#You will paste your code into this document where specified and submit this

#question one
def gc_content(DNA):
    """calculate the percent GC content of a dna sequence

    >>> gc_content("ATGCGGACCTAT")
    50
    >>> gc_content("ATGCGTTTATATATTGCATATATTT")
    20

    """
    "**YOUR CODE WILL GO BELOW THIS LINE***"

#####################################################
#question two####

def digest(sequence,enzyme):
    """determine the presence of a motif (entered as an argument) in a sequence entered as an argument
    and print the split the sequence into 2 after the pattern.
    I'd suggest you try some object methods for this. I'll bet you can google the answer

    >>>digest("ATCGCGAATTCAC","GAATTC")
    ATCGCGAA
    TTCAC
    >>>digest("ATCGCGAATTCAC","GG(A|T)CC")
    digestion site not found

    """
    if '**INSERT YOUR condition HERE':
        'INSERT THE REST OF YOUR CODE HERE'
    else:
        print("digestion site not found")

#####question three######
###this is here to be implemented in the next one. scroll down#####

def rev_seq(DNA):
    if len(DNA)==1:
        return DNA
    else:
        return rev_seq(DNA[1:])+ DNA[0]

def transcribe(DNA):
    """This program should implement rev_seq and replace all T with U
    maybe try a string method operator for this...
    
    >>>transcribe("ATCGCGAATTCAC")
    CACUUAAGCGCUA
    >>>transcribe("CACTTAAGCGCTA")
    AUCGCGAAUUCAC

    """
    "*****INSERT YOUR CODE HERE****"
