#include <stdio.h>
int main() {    

    int no1, no2, sum;
    
    printf("Enter two integers: ");
    scanf("%d %d", &no1, &no2);

    // calculating sum
    sum = no1 + no2;      
    
    printf("%d + %d = %d", no1, no2, sum);
    return 0;
}