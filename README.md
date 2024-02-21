# People Counter with Ultrasonic Sensor and LCD Display

## Overview
This Arduino project is designed to count the number of people passing by using an ultrasonic sensor. The count is displayed on a 16x2 LCD display. This could be useful for monitoring traffic in hallways, doorways, or other areas where it's important to track the number of people coming and going. The distance threshold for detecting a person can be adjusted according to the specific requirements of the deployment environment.

## Components Required
- Arduino board (Uno, Nano, Mega, or any compatible board)
- HC-SR04 Ultrasonic Sensor
- 16x2 LCD Display with I2C Interface
- Breadboard and jumper wires
- Optional: Resistors for level shifting (if needed for your Arduino model with the HC-SR04)

## Circuit Diagram
1. **Ultrasonic Sensor HC-SR04:**
   - VCC to 5V on Arduino
   - GND to GND on Arduino
   - TRIG to Digital Pin 3 on Arduino
   - ECHO to Digital Pin 2 on Arduino (Use a voltage divider if your Arduino operates at 3.3V)

2. **LCD Display:**
   - VCC to 5V on Arduino
   - GND to GND on Arduino
   - SDA to A4 (on Uno) or the SDA pin on your Arduino
   - SCL to A5 (on Uno) or the SCL pin on your Arduino

## Setup Instructions
1. Connect all components as per the circuit diagram.
2. Upload the provided code to your Arduino board.
3. Adjust the `distanceThreshold` variable in the code if necessary to better suit the detection range for your specific setup.

## Code Explanation
- The code initializes the LCD and ultrasonic sensor in the `setup()` function.
- In the `loop()` function, it sends a pulse from the ultrasonic sensor's trigger pin, then listens for an echo. The time taken for the echo to return is converted into distance.
- If an object is detected within the specified `distanceThreshold`, it is assumed to be a person passing by, and the `peopleCount` is incremented.
- The LCD display is updated with the new count, and the distance and count are also printed to the Serial Monitor for debugging purposes.
- A short delay is included to prevent the sensor from immediately detecting the same person again.

## Serial Monitor
To view the real-time distance and people count, open the Serial Monitor in the Arduino IDE. This can help in adjusting the distance threshold and for troubleshooting.

## Safety Notes
- Ensure that the ultrasonic sensor is securely mounted to prevent it from falling and potentially injuring someone or being damaged.
- Be mindful of privacy concerns if deploying this in public spaces.

By following these instructions and understanding the code, you should be able to create an effective people counter for a variety of applications.#   P e o p l e C o u n t e r W i t h U l t r a s o n i c A n d L C D  
 