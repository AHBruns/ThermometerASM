#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "thermo.h"

/*
int set_temp_from_ports(temp_t *temp){
    //if this goes over the bounds for the temp val
    if (THERMO_SENSOR_PORT < 0 || THERMO_SENSOR_PORT > 64000){
      return 1;
    }

    //if this goes over the bounds for the celcius or fahrenheit val
    if (THERMO_STATUS_PORT > 1 || THERMO_STATUS_PORT < 0){
      return 1;
    }

    temp -> is_fahrenheit = THERMO_STATUS_PORT;

    //this converts the sensor val to celcius
    temp -> tenths_degrees = ((THERMO_SENSOR_PORT+32)/64)-500;

    //this converts the sensor val to fahrenheit
    if (temp -> is_fahrenheit == 1){
      temp -> tenths_degrees = (((((THERMO_SENSOR_PORT+32)/64)-500)*9)/5)+320;
    }

    return 0;

}
*/

/*
//sets display to all zeroes
int set_display_from_temp(temp_t temp, int *display){
*display = 0b00000000000000000000000000000000;

//these are restrictions to prevent inputs that are too high or too low. if ther is anything
//past the bounds shows it will just return a long string of 1's
if (temp.is_fahrenheit != 1 && temp.is_fahrenheit != 0){
  *display = 0b11111111111111111111111111111111;
  return 1;
}

if (temp.is_fahrenheit == 1 && (temp.tenths_degrees < -580 || temp.tenths_degrees > 1220)){
  *display = 0b11111111111111111111111111111111;
  return 1;
}

if (temp.is_fahrenheit == 0 && (temp.tenths_degrees < -500 || temp.tenths_degrees > 500)){
  *display = 0b11111111111111111111111111111111;
  return 1;
}

//this is an if statement to set the negative on or off
int negative = 0;
if (temp.tenths_degrees < 0){
  negative = 1;
  temp.tenths_degrees = temp.tenths_degrees * -1;
}

//these are the bitmask numbers for turning on or off a certain line in the number from 0 - 9
int bitmasks[10] = {0b0111111, 0b0000110, 0b1011011, 0b1001111, 0b1100110, 0b1101101, 0b1111101, 0b0000111, 0b1111111, 0b1101111};

//these are the bitmask numbers for a negative or positive number
int neg[2] = {0b0000000, 0b1000000};

int temp_hundreds = ((temp.tenths_degrees / 1000) % 10);
int temp_tens = ((temp.tenths_degrees / 100) % 10);
int temp_ones = ((temp.tenths_degrees / 10) % 10);
int temp_tenths = (temp.tenths_degrees % 10);


//fahrenheit or celcius
if (temp.is_fahrenheit == 1){
  *display = (*display << 2) + 0b10;
}
else{
  *display = (*display << 2) + 0b01;
}
// printf("%d %d %d %d %d\n", temp_hundreds, temp_tens, temp_ones, temp_tenths, negative);
//set the hundreds place
if (temp_hundreds != 0){
  *display = (*display << 7) + bitmasks[temp_hundreds];
  *display = (*display << 7) + bitmasks[temp_tens];
  *display = (*display << 7) + bitmasks[temp_ones];
  *display = (*display << 7) + bitmasks[temp_tenths];
  //if hundreds place is zero
}

//if it is a double digit and it is negative
else if (temp_tens != 0 && negative == 1) {
  *display = (*display << 7) + neg[1];
  *display = (*display << 7) + bitmasks[temp_tens];
  *display = (*display << 7) + bitmasks[temp_ones];
  *display = (*display << 7) + bitmasks[temp_tenths];
}

else {
  //double digit and positive
  *display = (*display << 7) + neg[0];
  if (temp_tens != 0) {
    *display = (*display << 7) + bitmasks[temp_tens];
    *display = (*display << 7) + bitmasks[temp_ones];
    *display = (*display << 7) + bitmasks[temp_tenths];
  }

  //if there is a ones spot and it is negative
  else if (temp_ones != 0 && negative == 1) {
    *display = (*display << 7) + neg[1];
    *display = (*display << 7) + bitmasks[temp_ones];
    *display = (*display << 7) + bitmasks[temp_tenths];
  }

  //if there is not a ones spot and it is negative
  else if (temp_ones != 0 && negative == 0) {
    *display = (*display << 7) + neg[0];
    *display = (*display << 7) + bitmasks[temp_ones];
    *display = (*display << 7) + bitmasks[temp_tenths];
  }

  //if it is negative
  else {
    if (negative == 1) {
      *display = (*display << 7) + neg[1];
    }

    //else push a blank
    else {
      *display = (*display << 7) + neg[0];
    }

    //put in the ones
    //put in the tenths
    *display = (*display << 7) + bitmasks[temp_ones];
    *display = (*display << 7) + bitmasks[temp_tenths];
  }
}

//return 0 at the end
return 0;
}
*/


int thermo_update(){
  temp_t x;
  if(set_temp_from_ports(&x) == 0){
    set_display_from_temp(x, &THERMO_DISPLAY_PORT);
    return 0;
  }
  else{
    return 1;
  }
}
