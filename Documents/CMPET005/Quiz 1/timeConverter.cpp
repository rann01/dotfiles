//Ryan Gorka
//Feb 13, 2019
//This program converts a time in milliseconds to its value in minutes, seconds, and milliseconds.

#include <iostream>
using namespace std;

int main()
{
	float sampleTime = 5432165; //milliseconds
	float timeInMinutes = sampleTime / 60000;
	float timeInSeconds = sampleTime / 600000;

	cout << "A sample time of " << sampleTime << " milliseconds is equal to the following values in minutes, seconds, and it's original value\n";
	cout << sampleTime << " milliseconds equals " << timeInMinutes << " minutes\n";
	cout << sampleTime << " milliseconds equals " << timeInSeconds << " seconds\n";
	cout << sampleTime << " milliseconds equals " << sampleTime << "milliseconds\n";
