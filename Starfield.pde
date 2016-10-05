final int staticRADIUS = 125;
final int staticSIZE = 30;
final float slowSpeed = 0.05;
final int arraySize = 1200;
final int screenCenter = 350;
int theDirection = 1;
Particle[] theArray;
interface Particle
{
	public void show();
}
void setup()
{
	size(750,500);
	theArray = new Particle[arraySize];
	for (int i = 0; i < arraySize; i+=3)
	{
		theArray[i] = new NormalParticle();
		theArray[i+1] = new OddballParticle();
		theArray[i+2] =  new JumboParticle();
	}
	draw();
}
void draw()
{
	 background(128);
	for (int i = 0; i < arraySize; i++)
		theArray[i].show();
}
class NormalParticle implements Particle
{
	float angle;
	int r,g,b;
	
	NormalParticle()
	{
		angle = (float)Math.random()*6.283;
		r = (int)(Math.random()*256);
		g = (int)(Math.random()*256);
		b = (int)(Math.random()*256);
	}

	void show()
	{
		fill(r,g,b);
		angle+=slowSpeed*theDirection;
		ellipse((int)(mouseX+staticRADIUS*Math.cos(angle)),
			(int)(mouseY+staticRADIUS*Math.sin(angle)),
				staticSIZE,staticSIZE);
	}
}
class OddballParticle implements Particle
{
	int radiusIncrement = 0;
	float angle;
	int r,g,b;
	
	OddballParticle()
	{
		angle = (float)Math.random()*6.283;
		r = (int)(Math.random()*256);
		g = (int)(Math.random()*256);
		b = (int)(Math.random()*256);
	}

	void show()
	{
		fill(r,g,b);
		angle+=1.5*slowSpeed*theDirection;
		radiusIncrement+=20*Math.sin(10*angle);

		ellipse((int)(mouseX+(staticRADIUS*1.5+radiusIncrement)*Math.cos(angle)),
			(int)(mouseY+(staticRADIUS*1.5+radiusIncrement)*Math.sin(angle)),
				staticSIZE,staticSIZE);
	}
}
class JumboParticle extends NormalParticle
{
	int myRadius = 0;
	int increment = 1;

	void show()
	{
		fill(r,g,b);
		angle+=2*slowSpeed*theDirection*-1;
		myRadius += increment;
		if (myRadius > 250 || myRadius < 1)
		{
			increment*=(-1);
		}

		ellipse((int)(mouseX+myRadius*Math.cos(angle)),
			(int)(mouseY+myRadius*Math.sin(angle)),
				staticSIZE,staticSIZE);
	}
}
void mousePressed()
{
	theDirection*=-1;
}