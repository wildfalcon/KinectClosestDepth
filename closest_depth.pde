// Laurie Young and Oliver Legg
// Kinect example
// https://github.com/wildfalcon/KinectClosestDepth

https://github.com/shiffman/libfreenect/tree/master/wrappers/java/processing

import org.openkinect.*;
import org.openkinect.processing.*;

// Kinect Library object
Kinect kinect;
PImage greyscaleImage;

float a = 0;

// Size of kinect image
int w = 640;
int h = 480;

TrackingRectangle fullRectangle;
TrackingRectangle leftRectangle;
TrackingRectangle rightRectangle;

void setup(){
  size(w,h);
  kinect = new Kinect(this);
  kinect.start();
  kinect.enableDepth(true);
  
  fullRectangle = new TrackingRectangle(kinect, 0, 0, w, h, w);
  leftRectangle = new TrackingRectangle(kinect, 0, 0, w/2, h, w);
  rightRectangle = new TrackingRectangle(kinect, w/2, 0, w/2, h, w);

}

void draw(){
  greyscaleImage = kinect.getDepthImage();
  image(greyscaleImage, 0, 0);
  
  fill(250,10,10,200);
  noStroke();
  PVector closestFullPoint = fullRectangle.getClosestPoint();
  ellipse(closestFullPoint.x, closestFullPoint.y, 20, 20);
  
  fill(10,250,10,200);
  noStroke();
  PVector closestLeftPoint = leftRectangle.getClosestPoint();
  ellipse(closestLeftPoint.x, closestLeftPoint.y, 20, 20);

  fill(10,10,250,200);
  noStroke();
  PVector closestRightPoint = rightRectangle.getClosestPoint();
  ellipse(closestRightPoint.x, closestRightPoint.y, 20, 20);
  
}

void stop() {
  kinect.quit();
  super.stop();
}
