#include <stdio.h>
#include "print.h"
#include "math.h"

void add() {
	int r = 0;
	r = add_int(1,2);
	printf("Arm64 Adding 1 + 2: %d\n", r);
}

void printHelloWorldUsingArm64() {
	print_hello();
}

void printAnyStringArm64() {
	char s[] = "Printed using ARM64\n";
	char *c;
	c = s;
	printf("Address of word: %p\n", c);
	printf("Size of word: %zu\n",  sizeof(s));
	print_word(c, sizeof(s));
}

int main(void)
{
	add();
	printHelloWorldUsingArm64();
	printAnyStringArm64();
  
	return 0;
}