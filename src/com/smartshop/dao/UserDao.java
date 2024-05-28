package com.smartshop.dao;

import java.util.List;
import java.util.Map;

import com.smartshop.pojo.FriendPojo;
import com.smartshop.pojo.ProductCartPojo;
import com.smartshop.pojo.ProductCategoryPojo;
import com.smartshop.pojo.ProductDetailsPojo;
import com.smartshop.pojo.ReccomendationPojo;
import com.smartshop.pojo.TransctionLinePojo;
import com.smartshop.pojo.TransctionPojo;
import com.smartshop.pojo.UserPojo;
import com.smartshop.pojo.ViewPojo;

public interface UserDao {

	public boolean registeruser(UserPojo userPojo);
	public UserPojo login(String email, String Password);
	
	public List<ProductCartPojo> getCartListByUid(String user_id);
	
	public List<ViewPojo> getLastViewByUid(String user_id);
	
	public List<FriendPojo> getUserList(String user_id);
	
	public UserPojo getUserById(String user_id);
	
	public boolean sendRequest(FriendPojo friendpojo);
	

	public List<FriendPojo> getFriendList(String fromfriend);
	
	public List<ReccomendationPojo> getProductList(String fromfriend);
	
	public boolean recommendToFriend(ReccomendationPojo reccomendationPojo);
	
	public String getPassword(String fromuser);
	
	public UserPojo getUser(String email);
	
	
	public int addTotalTransction(TransctionPojo transctionPojo);
	public int getLastTransctionID();
	//public boolean addTransactionLine(TransctionLinePojo transctionLinePojo);
	public boolean addTransactionLine(int t_id, List<String> list);
	
	public boolean addDelivery(String user, int total, String add);
}
