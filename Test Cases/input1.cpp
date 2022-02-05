#include <stdio.h>
int main() {    

    int number2, number1, sum;
    
    printf("input two integers: ");
    scanf("%d %d", &number1, &number2);

    sum = number1 + number2;      
    
    printf("%d + %d = %d", number1, number2, sum);
    return 0;
}