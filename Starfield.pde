//TODO enlarge radius, enlarge number of stars, follow cursor

/*

Use center of window as center of circle
current angle++ for every iteration
it's in radians
x=center+RcosAngle
y=center+RsinAngle

*/

final int screenCenter = 350;
NormalParticle np,np2;
NormalParticle[] particles;
OddballParticle[] oddballs;
JumboParticle[] jumbos;
//your code here
void setup()
{
	size(750,750);
	particles = new NormalParticle[100];
	oddballs = new OddballParticle[100];
	jumbos = new JumboParticle[100];
	for (int i = 0; i < 100; i++)
		particles[i] = new NormalParticle();
	for (int i = 0; i < 100; i++)
		oddballs[i] = new OddballParticle();
	for (int i = 0; i < 100; i++)
		jumbos[i] = new JumboParticle();
	draw();
}
void draw()
{
	//background(128);
	for (int i = 0; i < 100; i++)
	{
		particles[i].show();
		oddballs[i].show();
		jumbos[i].show();
	}
}
class NormalParticle implements Particle
{
	double angle;
	int r,g,b;
	
	NormalParticle()
	{
		angle = Math.random()*6.283;
		r = (int)(Math.random()*256);
		g = (int)(Math.random()*256);
		b = (int)(Math.random()*256);
	}

	void show()
	{
		fill(r,g,b);
		angle+=staticSpeed;
		ellipse((int)(mouseX+staticRADIUS*Math.sin(angle)),
			(int)(mouseY+staticRADIUS*Math.cos(angle)),
				staticSIZE,staticSIZE);
	}
}
interface Particle
{
	final int staticRADIUS = 125;
	final int staticSIZE = 25;
	final double staticSpeed = 0.05;
}
class OddballParticle implements Particle
{
	int radiusIncrement = 0;
	double angle;
	int r,g,b;
	
	OddballParticle()
	{
		angle = Math.random()*6.283;
		r = (int)(Math.random()*256);
		g = (int)(Math.random()*256);
		b = (int)(Math.random()*256);
	}

	void show()
	{
		fill(r,g,b);
		angle+=2*staticSpeed;
		radiusIncrement+=20*Math.sin(angle);

		ellipse((int)(mouseX+(staticRADIUS+radiusIncrement)*Math.sin(angle)),
			(int)(mouseY+(staticRADIUS+radiusIncrement)*Math.cos(angle)),
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
		angle+=2*staticSpeed;
		myRadius += increment;
		if (myRadius > 200 || myRadius < 1)
		{
			increment*=(-1);
		}

		ellipse((int)(mouseX+myRadius*Math.sin(angle)),
			(int)(mouseY+myRadius*Math.cos(angle)),
				staticSIZE,staticSIZE);
	}
}

