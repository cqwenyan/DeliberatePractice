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
           Console.WriteLine("Alarm�������֣�ˮ�Ѿ� {0} ���ˣ�", param);
 }
 }
public class Display 
{
       public static void ShowMsg(int param) //��̬����
{ 
           Console.WriteLine("Display��ˮ���տ��ˣ���ǰ�¶ȣ�{0}�ȡ�", param);
 }
 }
class Program
{
	static void Main()
	{
Heater heter = new Heater();
Alarm alarm = new Alarm();

heater.BoilEvent += alarm.MakeAlert;    //ע�᷽��
heater.BoilEvent += (new Alarm()).MakeAlert;   //����������ע�᷽��
heater.BoilEvent += Display.ShowMsg;       //ע�ᾲ̬����
		
heater.BiolWater();
	}
}