## Robot ROS2 Package Template
 test
Goal here is to create a fairly low-cost mobile robot, that can:

Be remote controlled from a phone, with camera feedback (teleoperation)
Use lidar and SLAM to generate a map of a room and navigate autonomously
Use a camera with OpenCV to detect objects and follow them

Bill of Materials

Listed below is a rough bill of materials. As the project progresses I’ll try to return here with more details, and links to the posts for that section which will go into depth.

Please be aware that the links below are examples only! Not all of these links are to the exact items I am using, and I can't make any guarantees as to the quality of the products or sellers. Also, some of the links included below (marked with a *) are affiliate links, and using those ones will grant me a small commission which helps to keep producing this content!

I’ve deliberately not included pricing, due to the large and frequent variation in currencies, vendors, and general price fluctuations, so I encourage you to do your own research and figure out the costs. If you’re doing the project with others it may be worth looking into bulk orders - it can sometimes save a lot of money!

Item	Notes	Image	Link
Core			
Raspberry Pi 4B	Other single-board/USFF computers may also be suitable, or even better (e.g. Jetson, NUC). Ensure the system is 64-bit (ARM or x86) and ideally has at least 4GB RAM.	

Power			
3S LiPo Battery	I’ll be basing my build around a ~12V source. You may prefer a different voltage, chemistry, or form factor (if you know what you’re doing).	

HobbyKing
5V Regulator	Switch-mode buck converter from 12V (or whatever you have) to 5V. Ensure it is capable of sufficient current.		
Main power switch		

SparkFun
Momentary switch (Pi soft power)		

Adafruit
Terminal strip			
Various wires			
Appropriate connectors	Check the current ratings		
Motor/Drive system	My drive system will be based on brushed DC motors with encoders, since these can be had cheaply, are simple to use, and pretty robust. If you want to use something more advanced (e.g. Dynamixels, ODrive w/ BLDC), be prepared to write some code yourself. Time and money permitting, I’d like to explore these as upgrades down the track.		
Breadboard			
Arduino (e.g. Nano)	Any of the normal chip Arduinos or clones will be fine, I recommend the Nano form factor so it can be placed on a breadboard, but the regular form factor with no breadboard is probably also fine.	

Banggood*
2x12V DC Motors w/ encoders	Make sure it has encoders as we'll need them for speed feedback!	

Banggood
Motor driver board	I’ll be using a popular driver board with the cheap-and-nasty L298N driver. It’s pretty weak but it’ll work for my needs. If your robot is beefier you may want to check out something based on the BTS7960, but that will also require some additional coding.	

Banggood*
Motor mounts	Mine came bundled with the motor		
Wheels	Mine came bundled with the motor		
Sensors			
Camera	I’ll be using the official Raspberry Pi Camera (v2), but one of its many cheap clones will probably work fine. There are also USB cameras that will work but you’ll need to find a driver.	

Official Site
Lidar	I’ll be using the popular RPLidar A1, but there are a few similar models out there, you’ll just have to find the right driver.	

Banggood
Depth Camera	As an alternative to the Pi camera (and possibly even an alternative to the Lidar) I’m hoping to demonstrate the use of a depth camera, in particular the Luxonis OAK-D Lite. Depth cameras have all the benefits of a camera, with the addition that we can do some SLAM and 3D reconstruction more easily.	

Luxonis
Chassis	These are some of the parts I'll have, but I encourage you to come up with your own design!		
Main structure			
Caster wheel/s		

Screws, bolts, cable ties, etc.			
Useful extra things			
Display	The link is just an example (not the one I've used). There are a variety of sizes, resolutions, interfaces (HDMI/DSI), and touch types out there to choose from.	

Banggood*
Panel mount connectors	e.g. USB, HDMI	

Adafruit
Battery charger		

Banggood*
12V Power supply	You may be able to use the same one as the battery charger (check voltages and currents)		
Bluetooth game controller	I've included a link to the same controller I'm using (not the same seller). I wouldn't necessarily recommend it though, so maybe shop around...	

AliExpress
