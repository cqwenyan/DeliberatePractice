public class Heater
{
	private int temperature;
	public delegate void BoilHandler(int param);
	public event BoilHandler BiolEvent;
	
	public void BiolWater()
	{
		for(int i = 0; i <= 100; i++)
		{
			temperature = i;
			if(i>95)
			{
				if(BiolEvent>95)
				{
					if(BiolEvent != null)
					{
						BiolEvent(temperature);
					}
				}
			}
		}
	}
}
public class Alarm 
{
       public void MakeAlert(int param) 
 {
           Console.WriteLine("Alarm：嘀嘀嘀，水已经 {0} 度了：", param);
 }
 }
public class Display 
{
       public static void ShowMsg(int param) //静态方法
{ 
           Console.WriteLine("Display：水快烧开了，当前温度：{0}度。", param);
 }
 }
class Program
{
	static void Main()
	{
Heater heter = new Heater();
Alarm alarm = new Alarm();

heater.BoilEvent += alarm.MakeAlert;    //注册方法
heater.BoilEvent += (new Alarm()).MakeAlert;   //给匿名对象注册方法
heater.BoilEvent += Display.ShowMsg;       //注册静态方法
		
heater.BiolWater();
	}
}