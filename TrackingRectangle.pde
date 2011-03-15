class TrackingRectangle {
  
  Kinect kinect;
  int x;
  int y;
  int w;
  int h;
  int fullWidth;
  
  TrackingRectangle(Kinect kinect, int x, int y, int w, int h, int fullWidth) {
    this.kinect = kinect;
    this.fullWidth = fullWidth;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  PVector getClosestPoint() {
    int[] depth = kinect.getRawDepth();
    int closestX = -1;
    int closestY = -1;
    PVector point = new PVector();
    int closest = 300000;
  
    for(int ix = x; ix < (x+w); ix++) {
      for(int iy = y; iy < (y+h); iy++) {
        int offset = (iy*fullWidth)+ix;
        if(depth[offset] < closest) {
          closest = depth[offset];
          point.x = ix;
          point.y = iy;
        }
      } 
    }
    
    return point;
  }
  
}

