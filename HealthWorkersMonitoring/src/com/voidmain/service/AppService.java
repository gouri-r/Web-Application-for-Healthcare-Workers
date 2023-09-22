package com.voidmain.service;

import java.util.Date;

import com.voidmain.dao.HibernateDAO;
import com.voidmain.pojo.Dose;
import com.voidmain.pojo.User;

public class AppService {

	public static boolean isUserHadDose(String username,String type)
	{
		Date cdate=new Date();
		boolean isHad=false;
		User user=HibernateDAO.getUserById(username);
		
		for(Dose dose : HibernateDAO.getDoses())
		{
			if(dose.getUserid().equals(user.getAddarno()) && dose.getType().equals(type))
			{
				if(cdate.getMonth()==dose.getDate().getMonth() && cdate.getYear()==dose.getDate().getYear())
				{
					isHad=true;
				}
			}
		}
		return isHad;
	}
}
