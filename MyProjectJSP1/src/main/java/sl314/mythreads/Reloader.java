package sl314.mythreads;
import sl314.myclasses.Data;


public class Reloader implements Runnable{
	
	Data d;
	
	
	public Reloader(Data d)
	{
		this.d=d;
	}
	@Override
	public void run()
	{
		synchronized(d)
		{
		d.reload();
		}
	}
	
	}
