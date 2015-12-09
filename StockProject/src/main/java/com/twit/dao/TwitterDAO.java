package com.twit.dao;

import org.springframework.stereotype.Repository;

import com.mongodb.*;
import java.util.*;
@Repository
public class TwitterDAO {
    private MongoClient mc;
    private DB db;
    private DBCollection dbc;
    public TwitterDAO()
    {
    	try
    	{
    		mc=new MongoClient("localhost");
    		db=mc.getDB("mydb");
    		dbc=db.getCollection("tdata");
    	}catch(Exception ex){}
    }
    public void dataInsert(TwitterVO vo)
    {
    	try
    	{
    		DBCursor cursor=dbc.find();
    		int max=0;
    		while(cursor.hasNext())
    		{
    			BasicDBObject obj=
    				(BasicDBObject)cursor.next();
    			int no=obj.getInt("no");
    			if(max<no)
    			{
    				max=no;
    			}
    		}
    		cursor.close();
    		BasicDBObject insertObj=
    			    new BasicDBObject();
    		insertObj.put("no", max+1);
    		insertObj.put("id", vo.getId());
    		insertObj.put("regdate", vo.getRegdate());
    		insertObj.put("msg", vo.getMsg());
    		dbc.insert(insertObj);
    	}catch(Exception ex)
    	{
    		System.out.println(ex.getMessage());
    	}
    }
    public List<TwitterVO> dataAll(int page)
    {
    	List<TwitterVO> list=
    		  new ArrayList<TwitterVO>();
    	try
    	{
    		int rowSize=24;
    		int skip=(page*rowSize)-(rowSize);
    		DBCursor cursor=
    			dbc.find().sort(new BasicDBObject("no",-1))
    			.skip(skip).limit(rowSize);
    		while(cursor.hasNext())
    		{
    			BasicDBObject obj=
    				(BasicDBObject)cursor.next();
    			TwitterVO vo=new TwitterVO();
    			vo.setNo(obj.getInt("no"));
    			vo.setId(obj.getString("id"));
    			vo.setRegdate(obj.getString("regdate"));
    			vo.setMsg(obj.getString("msg"));
    			list.add(vo);
    		}
    		cursor.close();
    		
    	}catch(Exception ex)
    	{
    		System.out.println(ex.getMessage());
    	}
    	return list;
    }
    public int dataTotalPage()
    {
    	int total=0;
    	try
    	{
    		DBCursor cursor=dbc.find();
    		int count=cursor.count();
    		total=(int)(Math.ceil(count/9.0));
    	}catch(Exception ex){}
    	return total;
    }
}




