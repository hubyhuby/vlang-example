# Vlang short review as of May 2021

Vlang is an interesting language that compiles Go-ish code into C. 
It is in very early POC stage 0.2 (May 2021) and I imagine will take 2 more years to reach 1.0 stability.

Testing the language; it looks to me like it has improved over Go s API in important fields :
- Error handling!!! O god thks! (if err!= nil grrr!)
- import ( "all C libs /  ecosystem in the world(s) !" ) 
   => as it compiles to C, wrapers can be developed to link potentially any C lib.
- Go is staying on the server side. Many attempts have been made to compile it for tiny devices...such as the web browser and your fridge (https://tinygo.org/ Vugu).
 But this has not been very succesful. WASM garbage collection / size binary etc ...
=> Whereas V opens ways to compiling to anything and its attempting to have limited Garbage collection by design... from the start.
In theory that's the "silver bullet" that lets you build server side and front apps in one language.

# V's "Todo"
- Memory management is for now a promise / dream. 
 Let's see what this corner stone feature looks like in 0.3 ? 
- Multi CPU API is not yet there.
- Ecosystem seems to be growing very fast. Active people from the C and Go world seems to be joining every day.
- Over optimistic phrasing from the maintainer sometimes has been noted from several DEVs on the net. But hey, I can attest part of V actually works, and that s just impressing work!