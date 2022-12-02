float distance;
int duration;
int triggerPin = 9;
int echoPin = 10;

void setup() {
pinMode(triggerPin,OUTPUT);
pinMode(echoPin,INPUT);
Serial.begin(9600);
}

void loop() {
digitalWrite(triggerPin,LOW);
delay(2);
//clearing the trigger

digitalWrite(triggerPin,HIGH);
delay(10);
digitalWrite(triggerPin,LOW);

duration = pulseIn(echoPin,HIGH);
distance = duration*0.034/2;
Serial.println(distance);
delay(100);
}
