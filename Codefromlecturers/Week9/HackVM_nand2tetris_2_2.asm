//psuedocode to multiply:
// function(int x, int y)
//int n = 1
// int sum = 0
// while (n < y) {
    sum += sum + x
    n++
}
// return sum

function mult(x,y) // function call 
// set sum = 0 
push 0
pop sum 
// set n = 1
push 1 
pop n
// start of while loop 
labl LOOP
push n 
push y 
gt
if-goto ENDLOOP // n > y jump to end of loop 
// calcualte sum + x
push sum 
push x 
add
pop sum 
// calculate n = n + 1 
push n 
push 1 
add
pop n
// go to start of while lloop 
goto LOOP 
label ENDLOOP
push sum 
return 