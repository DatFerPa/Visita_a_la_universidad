import pKinect.PKinect;
 
PKinect kinect;
PVector [] loc;
 
void setup()
{
  size(640, 480);
  kinect = new PKinect(this);
  smooth();
  noFill();
  stroke(255, 255, 0);
}
 
void draw()
{
  background(0);
  loc = kinect.getSkeleton();
  drawSkeleton();
}
 
void drawSkeleton()
{
  // Body
  DrawBone(kinect.NUI_SKELETON_POSITION_HEAD,
  kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER);
  DrawBone(kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER,
  kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT);
  DrawBone(kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER,
  kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT);
  DrawBone(kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER,
  kinect.NUI_SKELETON_POSITION_SPINE);
  DrawBone(kinect.NUI_SKELETON_POSITION_SPINE,
  kinect.NUI_SKELETON_POSITION_HIP_CENTER);
  DrawBone(kinect.NUI_SKELETON_POSITION_HIP_CENTER,
  kinect.NUI_SKELETON_POSITION_HIP_LEFT);
  DrawBone(kinect.NUI_SKELETON_POSITION_HIP_CENTER,
  kinect.NUI_SKELETON_POSITION_HIP_RIGHT);
 
  // Left Arm
  DrawBone(kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT,
  kinect.NUI_SKELETON_POSITION_ELBOW_LEFT);
  DrawBone(kinect.NUI_SKELETON_POSITION_ELBOW_LEFT,
  kinect.NUI_SKELETON_POSITION_WRIST_LEFT);
  DrawBone(kinect.NUI_SKELETON_POSITION_WRIST_LEFT,
  kinect.NUI_SKELETON_POSITION_HAND_LEFT);
 
  // Right Arm
  DrawBone(kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT,
  kinect.NUI_SKELETON_POSITION_ELBOW_RIGHT);
  DrawBone(kinect.NUI_SKELETON_POSITION_ELBOW_RIGHT,
  kinect.NUI_SKELETON_POSITION_WRIST_RIGHT);
  DrawBone(kinect.NUI_SKELETON_POSITION_WRIST_RIGHT,
  kinect.NUI_SKELETON_POSITION_HAND_RIGHT);
 
  // Left Leg
  DrawBone(kinect.NUI_SKELETON_POSITION_HIP_LEFT,
  kinect.NUI_SKELETON_POSITION_KNEE_LEFT);
  DrawBone(kinect.NUI_SKELETON_POSITION_KNEE_LEFT,
  kinect.NUI_SKELETON_POSITION_ANKLE_LEFT);
  DrawBone(kinect.NUI_SKELETON_POSITION_ANKLE_LEFT,
  kinect.NUI_SKELETON_POSITION_FOOT_LEFT);
 
  // Right Leg
  DrawBone(kinect.NUI_SKELETON_POSITION_HIP_RIGHT,
  kinect.NUI_SKELETON_POSITION_KNEE_RIGHT);
  DrawBone(kinect.NUI_SKELETON_POSITION_KNEE_RIGHT,
  kinect.NUI_SKELETON_POSITION_ANKLE_RIGHT);
  DrawBone(kinect.NUI_SKELETON_POSITION_ANKLE_RIGHT,
  kinect.NUI_SKELETON_POSITION_FOOT_RIGHT);
}
 
void DrawBone(int _s, int _e)
{
  if (loc == null)
  {
    return;
  }
  PVector p1 = loc[_s];
  PVector p2 = loc[_e];
  if (p1.z == 0.0 || p2.z == 0.0)
  {
    return;
  }
  line(p1.x*width, p1.y*height, p2.x*width, p2.y*height);
}