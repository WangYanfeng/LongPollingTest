package Util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

//公共属性
public class Constants
{
	//保存Session的集合
	public static List<String> user=new ArrayList<String>();
	//保存消息的集合
	public static List<Map<String,String>> messageList=new ArrayList<Map<String,String>>();
	//Session和Thread映射集合
	public static Map<String,Thread> sessionThreadMap=new HashMap<String,Thread>();
	
	public static void addThread(String sessionId,Thread thread){
		sessionThreadMap.put(sessionId, thread);
	}
	
	public static void notifyAllThread(){
		Iterator<Map.Entry<String, Thread>> it=sessionThreadMap.entrySet().iterator();
		while(it.hasNext()){
			Map.Entry<String, Thread> entry=it.next();
			Thread thread=entry.getValue();
			synchronized(thread){
				thread.notify();
			}
		}
	}
	
	public static String getMessage(){
		Map<String,String> map=messageList.get(messageList.size()-1);
		
		String message=map.get("message");
		String time=map.get("time");
		return message;
	}
	public synchronized static void addMessage(String message,String time){
		Map<String,String> map=new HashMap<String,String>();
		map.put("message", message);
		map.put("time", time);
		messageList.add(map);
	}
}
