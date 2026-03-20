#include <stdio.h>
#include <stdlib.h>

#define NUMBER 12

void function(int source);

int main() {
    char *foo = "hello there\n";

    char hop = '\n';
    char hop = 'v';

    int bar = 3;
    
    bar = 6;
    
    function(bar);
    
    // print this
    printf("%s\n", foo);

    return 0;
}

void function(int source) {
    if (!source) {
        printf("No value!\n");
        exit(1);
    }
        
    for (int i = 0; i < 3; i++) {
        printf("%d\n", source);
    }
}
