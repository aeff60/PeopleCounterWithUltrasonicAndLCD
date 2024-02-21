#include <Wire.h> 
#include <LiquidCrystal_I2C.h>

LiquidCrystal_I2C lcd(0x27,16,2);  // set the LCD address to 0x27 for a 16 chars and 2 line display

const int trigPin = 3;
const int echoPin = 2;

long duration;
int distance;
int peopleCount = 0;
int distanceThreshold = 50; // ระยะที่สนใจวัด (เซนติเมตร)

void setup() {
  pinMode(trigPin, OUTPUT); 
  pinMode(echoPin, INPUT); 
  lcd.init();                      // initialize the lcd 
  lcd.backlight();
  Serial.begin(9600);
}

void loop() {
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  duration = pulseIn(echoPin, HIGH);
  distance = duration * 0.034 / 2;

  // เช็คว่ามีวัตถุอยู่ในระยะที่กำหนดหรือไม่
  if (distance > 0 && distance <= distanceThreshold) {
    // หลีกเลี่ยงการนับซ้ำจากการตรวจจับวัตถุเดียวกัน
    delay(1000); // หน่วงเวลาเพื่อรอให้วัตถุผ่านไป
    peopleCount++; // นับเป็นคนหนึ่งคน
  }

  // แสดงผลบน LCD
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("People Count:");
  lcd.setCursor(0, 1);
  lcd.print(peopleCount);

  // แสดงผลบน Serial Monitor
  Serial.print("Distance: ");
  Serial.print(distance);
  Serial.print(" cm, People Count: ");
  Serial.println(peopleCount);

  delay(100); // หน่วงเวลาสั้นๆ ก่อนวนซ้ำ
}
