package com.stock.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

public interface StockMapper {

	@Select("SELECT COUNT(*) FROM emp")
	   public int boardRowCount();
	      @SelectKey(keyProperty="no",resultType=int.class, before=true,
	         statement="SELECT NVL(MAX(no)+1,1) as no FROM stock")
	      @Insert("INSERT INTO stock VALUES(#{no},#{symbol}"
	            + ",#{name},#{ lastDate},#{lastPrice},SYSDATE)")
	      public void stockInsert(YahooStockVO vo);
	      
	      @Select("SELECT * FROM stock")
	      public List<YahooStockVO> stockAllData();
	      @Select("select lastPrice from (select lastPrice , rownum as num from stock where symbol=#{symbol} order by no desc ) where rownum <=6")
	      public List<YahooStockVO> stock6Data(String symbol);
}
