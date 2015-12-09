package com.twit.main;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import twitter4j.*;
@Component
public class MyTwitterStream {
	@Autowired
	private TwitterListener list;
    public void twitterStart()
    {
    	TwitterStream ts=new TwitterStreamFactory().getInstance();
    	FilterQuery fq=new FilterQuery();

    	String[] data={"엔씨소프트","LG전자","삼성SDS","한빛소프트","게임빌","네오위즈 홀딩스","카카오",
			       "애플","마이크로 소프트","인텔","어도비","구글"};
    	fq.track(data);
    	ts.addListener(list);
    	ts.filter(fq);
    }
}
/* * 		국내
			SKT : SK Telecom Co. Ltd. (017670.KS) 
			KT : KT Corp. (030200.KS)
			엔씨소프트 : NCsoft Corporation (036570.KS)
			네이버 : Naver Corporation (035420.KS)
			lg전자 : LG Electronics Inc. (066570.KS)
			삼성sds : Samsung SDS Co., Ltd. (018260.KS)
			한빛소프트 : HanbitSoft, Inc. (047080.KQ)
			게임빌 : GAMEVIL Inc. (063080.KQ)
			네오위즈홀딩스 : NEOWIZ Games Corporation (095660.KQ)
			카카오 : Kakao Corp. (035720.KQ)

			해외
			아마존 : Amazon.com, Inc. (AMZN) 
			AT&T : AT&T, Inc. (T)
			애플 : Apple Inc. (AAPL)
			마이크로 소프트 : Microsoft Corporation (MSFT)
			인텔 : Intel Corporation (INTC)
			어도비 : Adobe Systems Incorporated (ADBE)
			NVIDIA : NVIDIA Corporation (NVDA) 
			FaceBook : Facebook, Inc. (FB)
			Netflix : Netflix, Inc. (NFLX)
			구글 : Alphabet Inc. (GOOG)
 * 
 * 
*/

