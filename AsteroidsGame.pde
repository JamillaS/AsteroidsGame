
double distances;
ArrayList <Asteroid> asteroids;
ArrayList <Bullet> bullets;
SpaceShip ships = new SpaceShip();
Star[] stars = new Star[500];
public void setup() 
{
  
  size(400, 400);
   
asteroids = new ArrayList <Asteroid> ();
for(int j = 0; j < 8; j++)
{
  asteroids.add(new Asteroid());
}

bullets = new ArrayList <Bullet> ();


  for(int i = 0; i < 400; i ++)
  { 
    
    stars[i] = new Star();
  }
  for (int j = 400; j < 500; j ++)
  {
    stars[j] = new Jumbo();
  }
}
public void draw() 
{
  background(0);
  for(int i = 0; i < stars.length; i ++)
  {

    stars[i].show();
  }
  
  ships.move();
  ships.show();

  for(int b = 0; b < bullets.size(); b ++)
  {
    

    bullets.get(b).move();

    bullets.get(b).show();
    bullets.get(b).setPointDirection((int)ships.getPointDirection());
    
    
    
  }


  for(int ni = 0; ni < asteroids.size(); ni ++)
  {
    
    asteroids.get(ni).move();
    asteroids.get(ni).show();
    distances = dist(asteroids.get(ni).getX(),asteroids.get(ni).getY(),ships.getX(), ships.getY());
    if(distances < 20)
    {
        asteroids.remove(ni);

    }

    
  }
  
}
class Bullet extends Floater
{
  private int moveBullet;
  
  public Bullet()
  {
    
    moveBullet = 0;
    myCenterX = 200;
    myCenterY = 200;
    myPointDirection = 0;
    double dRadians = myPointDirection * (Math.PI/180);
    myDirectionX = 5 * Math.cos(dRadians) + myDirectionX;
    myDirectionY = 5 * Math.sin(dRadians) + myDirectionY;
  }
  public void move()
  {
    moveBullet += 10;
  }
  
  public void show()
  {
    fill(255, 0, 0);
    ellipse((int)ships.getX() , (int)ships.getY() , 5, 10);

  }
  public void setX(int x) { myCenterX = x;}
  public int getX() {return (int)myCenterX;}
  public void setY(int y) { myCenterY = y;}
  public int getY() {return (int)myCenterY;}
  public void setDirectionX( double x) { myDirectionX = x;}
  public double getDirectionX() { return myDirectionX;}
  public void setDirectionY(double y) { myDirectionY = y;}
  public double getDirectionY() { return myDirectionY;}
  public void setPointDirection(int degrees) {myPointDirection = degrees;}
  public double getPointDirection() { return myPointDirection;}
}


class Star
{
  protected int xPos;
  protected int yPos;
  public Star()
  {
    xPos = ((int)(Math.random() * 400));
    yPos = ((int)(Math.random() * 400));
  }
  public void show()
  {
      noStroke();
      
      fill(255);
      ellipse(xPos, yPos, 2, 2);

  }
}

class Jumbo extends Star
{
  public void show(){
    fill(255);
    ellipse(xPos, yPos, 5, 5);
  }
  
}

public void keyPressed()
{
  if(key == 'z')//hyperspace
  {
    ships.setX((int)(Math.random() * 380 + 10));
    ships.setY((int)(Math.random() * 380 + 10));
    ships.setDirectionX(0);
    ships.setDirectionY(0);
  }
  if(key == 'f')//rotates clockwise
  {
    ships.rotate(10);
    ships.getPointDirection(); 
  }
  if(key == 's')//rotates counter-clockwise
  {
    ships.rotate(-10);
    ships.getPointDirection();
  }
  if(key == 'd')//move forward
  {
    ships.accelerate(Math.random());
    ships.getDirectionX();
    ships.getDirectionY();
  }
  
  if(key == 'e')//move backwards
  {
    ships.accelerate(Math.random() - 1);
    ships.getDirectionX();
    ships.getDirectionY();
  }
  if(key == 'l')
  {
    bullets.add(new Bullet());

  }
  
  
}

class Asteroid extends Floater
{
  private int speedOfRotation;
  public Asteroid()
  {
    
    speedOfRotation = ((int)(Math.random() * 10) -5);
    corners = 6;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -10;
    xCorners[1] = -15;
    xCorners[2] = -10;
    xCorners[3] = 5;
    xCorners[4] = 10; 
    xCorners[5] = 5;
    yCorners[0] = 10;
    yCorners[1] = 5;
    yCorners[2] = -10;
    yCorners[3] = -10;
    yCorners[4] = 5; 
    yCorners[5] = 10;

    myColor = color(197);
    myCenterX = ((int)(Math.random() * 400));
    myCenterY = ((int)(Math.random() * 400));
    myDirectionX = ((int)(Math.random() * 10 - 5));
    myDirectionY = ((int)(Math.random() * 10 - 5));
    myPointDirection = ((int)(Math.random() * 10 - 5)); 
  }
  public void move()
  {
    myCenterX += (myDirectionX + (Math.random() * 3));
       
    myCenterY += (myDirectionX + (Math.random() * 3)); 
   
    rotate(speedOfRotation);
    super.move();

  }
  
  public void setX(int x) { myCenterX = x;}
  public int getX() {return (int)myCenterX;}
  public void setY(int y) { myCenterY = y;}
  public int getY() {return (int)myCenterY;}
  public void setDirectionX( double x) { myDirectionX = x;}
  public double getDirectionX() { return myDirectionX;}
  public void setDirectionY(double y) { myDirectionY = y;}
  public double getDirectionY() { return myDirectionY;}
  public void setPointDirection(int degrees) {myPointDirection = degrees;}
  public double getPointDirection() { return myPointDirection;}
}

class SpaceShip extends Floater
{   
  
  public SpaceShip()
  {
    
    corners = 4;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = 16; //head
    xCorners[1] = -8;
    xCorners[2] = -2;
    xCorners[3] = -8;
    yCorners[0] = 0; //head
    yCorners[1] = -8;
    yCorners[2] = 0;
    yCorners[3] = 8;
    
    myColor = color(0,255,255);
    myCenterX = 200;
    myCenterY = 200;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0; 
    
  }


    public void setX(int x) { myCenterX = x;}
    public int getX() {return (int)myCenterX;}
    public void setY(int y) { myCenterY = y;}
    public int getY() {return (int)myCenterY;}
    public void setDirectionX( double x) { myDirectionX = x;}
    public double getDirectionX() { return myDirectionX;}
    public void setDirectionY(double y) { myDirectionY = y;}
    public double getDirectionY() { return myDirectionY;}
    public void setPointDirection(int degrees) {myPointDirection = degrees;}
    public double getPointDirection() { return myPointDirection;}


}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

