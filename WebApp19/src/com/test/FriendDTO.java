/* ================
	FriendDTO.java
   ================
*/

package com.test;

public class FriendDTO
{
	private String name;			//-- 이름
	private String age;				//-- 나이
	private String gender;			//-- 성별
	private String[] idelType;		//-- 이상형
	
	
	// getter / setter 메소드 구성
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getAge()
	{
		return age;
	}
	public void setAge(String age)
	{
		this.age = age;
	}
	public String getGender()
	{
		return gender;
	}
	public void setGender(String gender)
	{
		this.gender = gender;
	}
	public String[] getIdelType()
	{
		return idelType;
	}
	public void setIdelType(String[] idelType)
	{
		this.idelType = idelType;
	}
	
}
