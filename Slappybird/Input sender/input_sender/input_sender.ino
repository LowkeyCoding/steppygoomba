void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
}

void loop() {
  // put your main code here, to run repeatedly:
  int measurement = analogRead(A0);
  if(measurement<240) measurement=240;
  if(measurement>400) measurement=400;
  int output = map(measurement, 240, 400, 0, 800);
  Serial.println(output);
  delay(30);
}
