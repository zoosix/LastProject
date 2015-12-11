package com.sist.news;
import java.util.*;

import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.sist.news.Item;
import com.sist.news.NewsManager;

import java.io.*;
//C:\springDev\springStudy\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\BigDataMiniProject\news
/*
 *    
 */
@Component
public class NewsDAO {
	@Autowired
	private NewsManager manager;
    public void newsSave(String data)
    {
    	try
    	{
    		String path="C:\\Users\\Zoosix\\git\\LastProject\\StockProject\\src\\main\\webapp\\news\\news.txt";
    		File file=new File(path);
    		FileWriter fw=new FileWriter(file);
    		List<Item> list=manager.getNewsData(data);
    		String strData="";
    		for(Item item:list)
    		{
    			strData+=item.getDescription()+"\n";
    		}
    		strData=strData.substring(strData.indexOf(']')+1);
    		String[] temp={"[","...","&quot;","&lt;","&gt;","'","'","\""};
			
			for(String s:temp)
			{
				while(strData.indexOf(s)>=0)
					strData=strData.replace(s, "");
			}
			fw.write(strData);
    		fw.close();
    		System.out.println("���� �Ϸ�");
    	}catch(Exception ex)
    	{
    		System.out.println(ex.getMessage());
    	}
    }
    public void createImage()
    {
    	try
    	{
    		RConnection rc=new RConnection();
    		rc.voidEval("Sys.setenv(JAVA_HOME=\"C:/Program Files/Java/jre1.8.0_45\")");
    		rc.voidEval("library(KoNLP)");
    		rc.voidEval("library(RColorBrewer)");
    		rc.voidEval("library(wordcloud)");
    		rc.voidEval("f<-file(\"C:/Users/Zoosix/git/LastProject/StockProject/src/main/webapp/news/news.txt\")");
    		rc.voidEval("textLine<-readLines(f)");
    		rc.voidEval("nouns<-sapply(textLine,extractNoun,USE.NAMES=F)");
    		rc.voidEval("close(f)");
    		rc.voidEval("wordcloud<-table(unlist(nouns))");
    		//rc.voidEval("png(\"C:/Users/sist/git/LastProject/StockProject/src/main/webapp/news/news.png\")");
    		rc.voidEval("png(\"C:/springDev/FINAL/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/StockProject/news\")");
    		rc.voidEval("wordcloud(names(wordcloud),freq=wordcloud,min.freq=2,rot.per=.2,random.order=F,scale=c(8,0,3),colors=rainbow(15),max.words=150)");
    		rc.voidEval("dev.off()");
    		rc.close();
    		File file=new File("C:\\springDev\\FINAL\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\StockProject\\news\\news.png");
    		FileInputStream fis=new FileInputStream(file);
    		FileOutputStream fos=new FileOutputStream("C:\\Users\\Zoosix\\git\\LastProject\\StockProject\\src\\main\\webapp\\news\\news.png");
    		
    		byte[] b=new byte[1024];
    		int i=0;
    		while((i=fis.read(b, 0, 1024))!=-1)
    		{
    			fos.write(b, 0, i);
    		}
    		fis.close();
    		fos.close();
    	}catch(Exception ex)
    	{
    		System.out.println(ex.getMessage());
    	}
    }
}



