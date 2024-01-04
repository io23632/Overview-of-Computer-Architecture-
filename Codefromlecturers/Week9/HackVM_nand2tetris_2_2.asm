//psuedocode to multiply:
// function(int x, int y)
//int n = 1
// int sum = 0
// while (n < y) {
//  sum += sum + x
//    n++
//}
// return sum

// function(int x, int y)
function mult 2 
//int sum = 0 
// int n = 1
push constant 0
pop local 0 
push constant 1 
pop local 1
// while (n < y) 
label LOOP
push local 1
push argument 1
gt
if-goto LOOP_END
// sum = sum + x
push local 0 
push argument 0 
add
pop local 0
// n++
push local 1 
push constant 1
add 
pop local 1
LOOP
label LOOP_END
push local 0
return