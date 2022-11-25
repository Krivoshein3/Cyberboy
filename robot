#include <IRremote.h>

int brightness = 255;
int leds[3] = {5,4,3};
int curPin[3] = {0,1,2};
int irPort = 12;
int motorPinright = 8;
int motorPinleft = 7;
int motorPinrightbackward = 6;
int motorPinleftbackward = 5;

IRrecv irrecv(irPort);

decode_results results;

void setup()
{
    Serial.begin(9600);
    irrecv.enableIRIn();
    pinMode(motorPinleft, OUTPUT);
    pinMode(motorPinright, OUTPUT);
    pinMode(motorPinrightbackward, OUTPUT);
    pinMode(motorPinleftbackward, OUTPUT);
    for(int i = 0; i < 3; i++)
        pinMode(leds[i], OUTPUT);
}

void loop()
{
    if (irrecv.decode())
    {
        // Serial.println(irrecv.decodedIRData.decodedRawData, HEX);
        move();

        irrecv.resume();
    }
}

void move()
{
    long int hexDataButton = irrecv.decodedIRData.decodedRawData;

    if (hexDataButton == 0x2ED100FF){
        digitalWrite(motorPinleft, HIGH);
        digitalWrite(motorPinright, HIGH);
}
    if (hexDataButton == 0x2CD300FF){
        digitalWrite(motorPinleft, HIGH);
        digitalWrite(motorPinrightbackward, HIGH);
}
    if (hexDataButton == 0x2BD400FF){
        digitalWrite(motorPinleftbackward, HIGH);
        digitalWrite(motorPinright, HIGH);
}
    if (hexDataButton == 0x2DD200FF){
        digitalWrite(motorPinrightbackward, HIGH);
        digitalWrite(motorPinleftbackward, HIGH);
}
    if (hexDataButton == 0x55AA00FF){
        digitalWrite(motorPinleft, LOW);
        digitalWrite(motorPinrightbackward, LOW);
        digitalWrite(motorPinright, LOW);
        digitalWrite(motorPinleftbackward, LOW);
    }
    if (hexDataButton == 0x54D400FF){
        digitalWrite(motorPinleft, HIGH);
        digitalWrite(motorPinright, HIGH);
        delay(600);
        digitalWrite(motorPinleft, LOW);
        digitalWrite(motorPinright, LOW);
        //analogWrite(leds[curPin[0]], brightness);
        //delay(300);
        //digitalWrite(motorPinleft, HIGH);
        //digitalWrite(motorPinright, HIGH);
        delay(600);
        digitalWrite(motorPinleft, LOW);
        digitalWrite(motorPinright, LOW);
        //analogWrite(leds[curPin[0]], 255 - brightness);
        //analogWrite(leds[curPin[1]], brightness);
        delay(300);
        digitalWrite(motorPinleft, HIGH);
        digitalWrite(motorPinright, HIGH);
        delay(600);
        digitalWrite(motorPinleft, LOW);
        digitalWrite(motorPinright, LOW);
        //analogWrite(leds[curPin[1]], 255 - brightness);
        //analogWrite(leds[curPin[2]], brightness);
        delay(300);
        digitalWrite(motorPinleft, HIGH);
        digitalWrite(motorPinright, HIGH);
        delay(600);
        digitalWrite(motorPinleft, LOW);
        digitalWrite(motorPinright, LOW);
        //analogWrite(leds[curPin[2]], 255 - brightness);
        //analogWrite(leds[curPin[3]], brightness);
        delay(300);
        //analogWrite(leds[curPin[3]], 255 - brightness);
    }
        Serial.println("B");
    if (hexDataButton == 0x53AC00FF)
        Serial.println("C");
    if (hexDataButton == 0x52AD00FF)
        Serial.println("D");
}
