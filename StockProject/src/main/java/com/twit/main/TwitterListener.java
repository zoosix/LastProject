package com.twit.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import twitter4j.StallWarning;
import twitter4j.Status;
import twitter4j.StatusDeletionNotice;
import twitter4j.StatusListener;
import com.twit.dao.*;
import java.util.*;
import java.text.*;
@Component
public class TwitterListener implements StatusListener{
    @Autowired
	private TwitterDAO dao;
	@Override
	public void onException(Exception ex) {
		// TODO Auto-generated method stub
		System.out.println(ex.getMessage());
	}

	@Override
	public void onDeletionNotice(StatusDeletionNotice arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void onScrubGeo(long arg0, long arg1) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void onStallWarning(StallWarning arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void onStatus(Status status) {
		// TODO Auto-generated method stub
		try
		{
			TwitterVO vo=new TwitterVO();
			String id=status.getUser().getScreenName();
			String regdate=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(status.getCreatedAt());
			vo.setId(id);
			vo.setRegdate(regdate);
			String msg=status.getText();
			String[] temp={"//","...","://","@:",",","/.","./","/",":/.","@","#"};
			msg=msg.substring(msg.indexOf(':')+1);
			for(String s:temp)
			{
				while(msg.indexOf(s)>=0)
					msg=msg.replace(s, "");
			}
			vo.setMsg(msg);//.replaceAll("[a-zA-Z0-9]", "")
			dao.dataInsert(vo);
			System.out.println(id+"-"+regdate+" "
					+vo.getMsg());
		}catch(Exception ex){System.out.println(ex.getMessage());}
	}

	@Override
	public void onTrackLimitationNotice(int arg0) {
		// TODO Auto-generated method stub
		
	}

}
