home    = /home/courses/cop4530p/LIB
cpp     = $(home)/cpp
tcpp    = $(home)/tcpp
proj    = .
tests   = .
incpath = -I$(proj) -I$(cpp) -I$(tcpp)
CC      = clang++ -std=c++11 -Wall -Wextra

common  =  bitvect.o hashfunctions.o primes.o xstring.o

standard: fhtbl.x

all: standard fhtblKISS.x fhtblMM.x fhtblSimple.x rantable.x hashcalc.x

rantable.x: rantable.cpp
	$(CC) -o rantable.x $(incpath) rantable.cpp

hashcalc.x: hashcalc.cpp
	$(CC) -o hashcalc.x $(incpath) hashcalc.cpp

fhtbl.x: fhtbl.o $(common)
	$(CC) -o fhtbl.x fhtbl.o # $(common)

fhtblKISS.x: fhtblKISS.o $(common)
	$(CC) -o fhtblKISS.x fhtblKISS.o # $(common)

fhtblMM.x: fhtblMM.o $(common)
	$(CC) -o fhtblMM.x fhtblMM.o # $(common)

fhtblSimple.x: fhtblSimple.o $(common)
	$(CC) -o fhtblSimple.x fhtblSimple.o # $(common)

hasheval.x: hasheval.o $(common)
	$(CC) -o hasheval.x hasheval.o $(common)

hashevalKISS.x: hashevalKISS.o $(common)
	$(CC) -o hashevalKISS.x hashevalKISS.o $(common)

fhtbl.o: $(proj)/fhtbl.cpp $(proj)/hashtbl.h
	$(CC) $(incpath) -c $(tests)/fhtbl.cpp

fhtblKISS.o: $(proj)/fhtblKISS.cpp $(proj)/hashtbl.h
	$(CC) $(incpath) -c $(tests)/fhtblKISS.cpp

fhtblMM.o: $(proj)/fhtblMM.cpp $(proj)/hashtbl.h
	$(CC) $(incpath) -c $(tests)/fhtblMM.cpp

fhtblSimple.o: $(proj)/fhtblSimple.cpp $(proj)/hashtbl.h
	$(CC) $(incpath) -c $(tests)/fhtblSimple.cpp

hashfunctions.o: $(cpp)/hashfunctions.h $(cpp)/hashfunctions.cpp
	$(CC) $(incpath) -c $(cpp)/hashfunctions.cpp

xstring.o: $(cpp)/xstring.h $(cpp)/xstring.cpp
	$(CC) $(incpath) -c $(cpp)/xstring.cpp

bitvect.o: $(cpp)/bitvect.h $(cpp)/bitvect.cpp
	$(CC) $(incpath) -c $(cpp)/bitvect.cpp

primes.o: $(cpp)/primes.h $(cpp)/primes.cpp
	$(CC) $(incpath) -c $(cpp)/primes.cpp
