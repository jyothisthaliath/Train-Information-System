# Front Pages & Administrative Details

## Title Page

**TRAIN TRACKING SYSTEM WITH TOUCHSCREEN AND SMS INTERFACE**

**A Main Project Report**

Submitted by:
*   **Johney Cherian**
*   **Jyothis George Thaliath**
*   **Merin Jose**
*   **Mithin Mathew**

In partial fulfillment of the requirements for the award of the degree of **Bachelor of Technology in Electronics & Communication Engineering**

**FEDERAL INSTITUTE OF SCIENCE AND TECHNOLOGY (FISAT)**
Angamaly-683577, Ernakulam

Affiliated to
**MAHATMA GANDHI UNIVERSITY**
Kottayam-686560

**MAY 2012**

---

## Certificate

**FEDERAL INSTITUTE OF SCIENCE AND TECHNOLOGY (FISAT)**
Mookkannoor (P.O), Angamaly-683577

This is to certify that the main project report titled **TRAIN TRACKING SYSTEM WITH TOUCHSCREEN AND SMS INTERFACE** submitted by **Johney Cherian**, **Jyothis George Thaliath**, **Merin Jose**, and **Mithin Mathew** towards partial fulfillment of the requirements for the award of the degree of **Bachelor of Technology in Electronics and Communication Engineering** is a record of bonafide work carried out by them during the academic year 2011–2012.

*   **Mrs. P.R. Mini** (Internal Guide & Head of the Department)
*   **Place**: Angamaly
*   **Date**: May 2012

---

## Acknowledgement

We express our deep sense of gratitude to our principal, **Dr. K.S.M. Panicker**, who extended all resources for the successful completion of our project. We also express our sincere thanks to our Project Guide, **Mrs. P.R. Mini**, Head of the Department of Electronics and Communication Engineering, FISAT, Angamaly, for her most valuable help and support in carrying out this project work and also for her concern shown during intricate situations.

We would also like to extend our sincere thanks to our project coordinators, **Mrs. Aiswariya Raj**, **Mrs. Ambily A.R**, and **Ms. Rekha R**, Assistant Professors, Department of Electronics and Communication, for their valuable support, and to all staff members of the Department of Electronics and Communication, FISAT, Angamaly, whose help has led to the completion of this report.

Last but not the least, we are grateful to our parents and friends for their valuable aid without which we would not have accomplished this work as planned.

---

## Abstract

This project aims to develop a device that tracks the movement of trains to indicate the location of each station in real-time. Finding the location of a train for a passenger on the move can be a difficult task, especially during bad weather or night journeys. This project eliminates these difficulties by making train status information easily accessible to passengers.

This project is implemented using **Global Positioning System (GPS)** and **General Packet Radio Service (GPRS)** technologies. The onboard system features a dedicated microcontroller that coordinates tracking operations. The location coordinates from the GPS system are uploaded to a remote station server via GPRS communication. This enables passengers and station operators to track a train in real-time from anywhere in the world using an internet-enabled device and mapping frameworks like Google Maps. Telemetry is updated continuously by the onboard GPS receiver and uploaded periodically to the server to provide the latest tracking coordinates.

In addition, the system provides information about the next station to be reached. People in closed passenger coaches (such as AC coaches) are often unaware of the upcoming stations or the expected time of arrival (ETA). To solve this, a PC application calculates the distance between the current coordinates of the train and the database of upcoming stations. Passengers can request train tracking status simply by sending an SMS to the station module. The station module decodes the request and sends a detailed SMS back to the passenger containing the current position, distance to the next station, and expected travel time. This ensures passengers get enough time to prepare and do not miss their stations.
