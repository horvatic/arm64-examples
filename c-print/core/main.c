#include "io.h"
#include "hello.h"

void printHelloWorldUsingArm64() {
	print_hello();
}

void printAnyStringArm64() {
	char s[] = "Printed using ARM64\n";
	print_word(&s[0], sizeof(s));
}

void readInputPrintInput() {
	int bufferSize = 100;
	char buffer[bufferSize];

	long inputSize = 0;
	inputSize = read_word(&buffer[0], bufferSize);
	print_word(&buffer[0], inputSize);
}

int main(void)
{
	printHelloWorldUsingArm64();
	printAnyStringArm64();
  readInputPrintInput();
  
	return 0;
}
