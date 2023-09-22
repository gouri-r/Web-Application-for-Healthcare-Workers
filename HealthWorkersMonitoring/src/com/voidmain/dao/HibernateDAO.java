package com.voidmain.dao;

import java.util.List;
import com.voidmain.pojo.Dose;
import com.voidmain.pojo.Employee;
import com.voidmain.pojo.Message;
import com.voidmain.pojo.User;

public class HibernateDAO {

	public static boolean isValidEmployee(String employeename,String password)
	{
		Employee employee=getEmployeeById(employeename);

		if(employee!=null)
		{
			return true;
		}

		return false;
	}

	//============================================================================

	public static Employee getEmployeeById(String id)
	{
		return (Employee)HibernateTemplate.getObject(Employee.class,id);
	}

	public static int deleteEmployee(int id)
	{
		return HibernateTemplate.deleteObject(Employee.class,id);
	}

	public static List<Employee> getEmployees()
	{
		List<Employee> employees=(List)HibernateTemplate.getObjectListByQuery("From Employee");

		return employees;
	}
	
	//=========================================================================

	public static Message getMessageById(int id)
	{
		return (Message)HibernateTemplate.getObject(Message.class,id);
	}

	public static int deleteMessage(int id)
	{
		return HibernateTemplate.deleteObject(Message.class,id);
	}

	public static List<Message> getMessages()
	{
		List<Message> messages=(List)HibernateTemplate.getObjectListByQuery("From Message");

		return messages;
	}
	
	//==============================================================
	
	public static User getUserById(String id)
	{
		return (User)HibernateTemplate.getObject(User.class,id);
	}

	public static int deleteUser(int id)
	{
		return HibernateTemplate.deleteObject(User.class,id);
	}

	public static List<User> getUsers()
	{
		List<User> users=(List)HibernateTemplate.getObjectListByQuery("From User");

		return users;
	}
	
	//=====================================================================
	
	public static Dose getDoseById(String id)
	{
		return (Dose)HibernateTemplate.getObject(Dose.class,id);
	}

	public static int deleteDose(int id)
	{
		return HibernateTemplate.deleteObject(Dose.class,id);
	}

	public static List<Dose> getDoses()
	{
		List<Dose> doses=(List)HibernateTemplate.getObjectListByQuery("From Dose");

		return doses;
	}
}
