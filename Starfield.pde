//TODO find what the problem with slowSpeed is
final int staticRADIUS = 175;
final int staticSIZE = 30;
final float slowSpeed = 0.05;
final int arraySize = 150;
final int screenCenter = 350;
NormalParticle np,np2;
NormalParticle[] particles;
OddballParticle[] oddballs;
JumboParticle[] jumbos;
int theDirection = 1;
//your code here
interface Particle
{
	public void show();
}
void setup()
{
	size(750,750);
	particles = new NormalParticle[arraySize];
	oddballs = new OddballParticle[arraySize];
	jumbos = new JumboParticle[arraySize];
	for (int i = 0; i < arraySize; i++)
		particles[i] = new NormalParticle();
	for (int i = 0; i < arraySize; i++)
		oddballs[i] = new OddballParticle();
	for (int i = 0; i < arraySize; i++)
		jumbos[i] = new JumboParticle();
	draw();
}
void draw()
{
	background(128);
	for (int i = 0; i < arraySize; i++)
	{
		particles[i].show();
		oddballs[i].show();
		jumbos[i].show();
	}
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
		ellipse((int)(mouseX+staticRADIUS*Math.sin(angle)),
			(int)(mouseY+staticRADIUS*Math.cos(angle)),
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

		ellipse((int)(mouseX+(staticRADIUS*1.5+radiusIncrement)*Math.sin(angle)),
			(int)(mouseY+(staticRADIUS*1.5+radiusIncrement)*Math.cos(angle)),
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
		if (myRadius > 350 || myRadius < 1)
		{
			increment*=(-1);
		}

		ellipse((int)(mouseX+myRadius*Math.sin(angle)),
			(int)(mouseY+myRadius*Math.cos(angle)),
				staticSIZE,staticSIZE);
	}
}

void mousePressed()
{
	theDirection*=-1;
}