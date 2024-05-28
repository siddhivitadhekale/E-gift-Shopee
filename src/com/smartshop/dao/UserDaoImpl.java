package com.smartshop.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.sql.*;

import com.smartshop.pojo.FriendPojo;
import com.smartshop.pojo.ProductCartPojo;
import com.smartshop.pojo.ProductCategoryPojo;
import com.smartshop.pojo.ProductDetailsPojo;
import com.smartshop.pojo.ReccomendationPojo;
import com.smartshop.pojo.TransctionLinePojo;
import com.smartshop.pojo.TransctionPojo;
import com.smartshop.pojo.UserPojo;
import com.smartshop.pojo.ViewPojo;
import com.smartshop.util.MyConnection;

public class UserDaoImpl implements UserDao{

	@Override
	public boolean registeruser(UserPojo userPojo) {
		// TODO Auto-generated method stub
		
		Connection  conn=null;
		try {
			conn=MyConnection.getConnectionObj();
			PreparedStatement ps=conn.prepareStatement("insert into user_table(user_name,mobile_no,email,password,login_status) values(?,?,?,?,?)");
	
			
			ps.setString(1, userPojo.getUsername());
			ps.setString(2, userPojo.getMobile_no());
			ps.setString(3, userPojo.getEmail());
			ps.setString(4, userPojo.getPassword());
			ps.setString(5,"active");
			
			
			int i=ps.executeUpdate();
			
			if(i>0)
			{
				System.out.println("iiiiiiiiiiiiiiiiiiiii");
				return true;
			}
			else
			{
				return false;
			}
			

		}catch (Exception e) {
		e.printStackTrace();
		}
		
		
		
		return false;
	}

	@Override
	public UserPojo login(String email, String Password) {
		// TODO Auto-generated method stub
		
		Connection conn=null;
		PreparedStatement ps=null;
		
		System.out.println("email USER IMPL"+email);
		System.out.println("Password USER IMPL"+Password);
		try {
			conn=MyConnection.getConnectionObj();
			ps=conn.prepareStatement("select * from user_table where email=? and password=?");
			
			
			
			ps.setString(1, email);
			ps.setString(2, Password);
			
			ResultSet rs=ps.executeQuery();
			List<UserPojo> userlist=new ArrayList<UserPojo>();
			while(rs.next())
			{
				UserPojo userPojo=new UserPojo();
				userPojo.setUser_id(rs.getInt("user_id"));
				userPojo.setUsername(rs.getString("user_name"));
				userPojo.setMobile_no(rs.getString("mobile_no"));
				userPojo.setEmail(rs.getString("email"));
				userPojo.setEmail(rs.getString("password"));
				userPojo.setLogin_status("login_status");
				return userPojo;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public List<ProductCartPojo> getCartListByUid(String user_id) {
		// TODO Auto-generated method stub
		
		Connection  conn=null;
		PreparedStatement ps=null;
		try {
			conn=MyConnection.getConnectionObj();
			ps=conn.prepareStatement("select * from product_cart where user_name=?");
			//ps.setInt(1, 1);
			ps.setString(1, user_id);
			ResultSet rs=ps.executeQuery();
			System.out.println("result"+ps);
			List<ProductCartPojo> listvalue=new ArrayList<ProductCartPojo>();
			while(rs.next())
			{
				ProductCartPojo productCartPojo=new ProductCartPojo();
				productCartPojo.setId(rs.getInt("id"));
				productCartPojo.setPrice(rs.getInt("price"));
				productCartPojo.setProduct_id(rs.getInt("product_id"));
				productCartPojo.setQuantity(rs.getInt("quantity"));
				productCartPojo.setTotal_price(rs.getInt("total_price"));
				productCartPojo.setUsername(rs.getString("user_name"));
				
				 int pid=rs.getInt("product_id");
				 
				 ps=conn.prepareStatement("select * from product_details where product_id=?");
				 ps.setInt(1, pid);
				 ResultSet rs1=ps.executeQuery();
				 if(rs1.next())
				 {
					 productCartPojo.setProduct_name(rs1.getString("product_name"));
					 productCartPojo.setProduct_path(rs1.getString("product_path"));
					 System.out.println("productname..............."+rs1.getString("product_name"));
				 }
				 
				listvalue.add(productCartPojo);
				
			}
			return listvalue;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return null;
	}

	@Override
	public List<ViewPojo> getLastViewByUid(String user_id) {
		// TODO Auto-generated method stub
		
		Connection  conn=null;
		PreparedStatement ps=null;
		try {
			conn=MyConnection.getConnectionObj();
			ps=conn.prepareStatement("select * from view_table where user_name=?");
			//ps.setInt(1, 1);
			ps.setString(1, user_id);
			ResultSet rs=ps.executeQuery();
			System.out.println("result"+ps);
			List<ViewPojo> listvalue=new ArrayList<ViewPojo>();
			while(rs.next())
			{
				ViewPojo viewpojo=new ViewPojo();
				viewpojo.setId(rs.getInt("id"));
				viewpojo.setProduct_id(rs.getInt("product_id"));
				viewpojo.setUser_id(rs.getString("user_name"));
				viewpojo.setDate(rs.getString("date"));
				
				
				 int pid=rs.getInt("product_id");
				 System.out.println("///////pid"+pid);
				 
				 ps=conn.prepareStatement("select * from product_details where product_id=?");
				 ps.setInt(1, pid);
				 ResultSet rs1=ps.executeQuery();
				 if(rs1.next())
				 {
					 viewpojo.setProduct_name(rs1.getString("product_name"));
					 viewpojo.setProduct_path(rs1.getString("product_path"));
					 viewpojo.setCategory_code(rs1.getString("category_code"));
					 viewpojo.setProduct_cat(rs1.getString("product_cat"));
					 viewpojo.setProduct_color(rs1.getString("product_color"));
					 viewpojo.setProduct_des(rs1.getString("product_des"));
					 viewpojo.setProduct_fabrics(rs1.getString("product_fabrics"));
					 viewpojo.setProduct_material(rs1.getString("product_material"));
					 viewpojo.setProduct_price(rs1.getInt("product_price"));
					 viewpojo.setProduct_size(rs1.getString("Product_size"));
					 viewpojo.setProduct_sub_category(rs1.getString("product_sub_category"));
					 System.out.println("productname..............."+rs1.getString("product_name"));
				 }
				 
				listvalue.add(viewpojo);
				
			}
			return listvalue;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return null;
	}

	@Override
	public List<FriendPojo> getUserList(String user_id) {
		// TODO Auto-generated method stub
		System.out.println("user_id"+user_id);
		
Connection conn=null;
		
		try {
			
			conn=MyConnection.getConnectionObj();
			PreparedStatement ps=conn.prepareStatement("select * from friends_table where from_friend=?");
			
			ps.setString(1, user_id);
			
			ResultSet rs=ps.executeQuery();
			List<FriendPojo> userList=new ArrayList<FriendPojo>();

			while(rs.next())
			{
				FriendPojo friendPojo=new FriendPojo();
				friendPojo.setTo_friend(rs.getString("to_friend"));
				
				
				System.out.println("...........email"+rs.getString("to_friend"));
				/*studentPojo.setStudent_name(rs.getString("student_name"));
				studentPojo.setStudent_department(rs.getString("student_department"));
				studentPojo.setStudent_BE(rs.getDouble("student_BE"));*/
				
				userList.add(friendPojo);
			}
			return userList;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return null;
	}

	@Override
	public UserPojo getUserById(String user_id) {
		// TODO Auto-generated method stub
		
		
		Connection conn=null;
		PreparedStatement ps=null;
		
		
		try {
			
			conn=MyConnection.getConnectionObj();
			ps=conn.prepareStatement("select * from user_table where email=?");
					
			ps.setString(1, user_id);
			
			ResultSet rs=ps.executeQuery();
			
			if(rs.next())
			{
				UserPojo user=new UserPojo(); 
				user.setEmail(rs.getString("email"));
				user.setMobile_no(rs.getString("mobile_no"));
				user.setLogin_status(rs.getString("login_status"));
				user.setPassword(rs.getString("password"));
				user.setUsername(rs.getString("user_name"));
				
				
			
				
				return user;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		return null;
	}

	@Override
	public boolean sendRequest(FriendPojo friendpojo) {
		// TODO Auto-generated method stub
		
		Connection  conn=null;
		try {
			
			conn=MyConnection.getConnectionObj();
			String from=friendpojo.getFrom_friend();
			String to=friendpojo.getTo_friend();
			System.out.println("to..............."+to);
			
			
			PreparedStatement ps=conn.prepareStatement("insert into friends_table(from_friend,to_friend,status,date) values(?,?,?,curdate())");
	
			
			ps.setString(1, friendpojo.getFrom_friend());
			ps.setString(2, friendpojo.getTo_friend());
			ps.setString(3, "Accepted");
			
			
			int i=ps.executeUpdate();
			
			if(i>0)
			{
				System.out.println("iiiiiiiiiiiiiiiiiiiii");
				return true;
			}
			else
			{
				return false;
			}
		   //}

		}catch (Exception e) {
		e.printStackTrace();
		}
		

		
		
		return false;
	}

	@Override
	public List<FriendPojo> getFriendList(String fromfriend) {
		// TODO Auto-generated method stub
		
		
Connection conn=null;
		
		try {
			
			conn=MyConnection.getConnectionObj();
			PreparedStatement ps=conn.prepareStatement("select * from friends_table where from_friend=?");
			
			ps.setString(1, fromfriend);
			
			ResultSet rs=ps.executeQuery();
			List<FriendPojo> friendList=new ArrayList<FriendPojo>();

			while(rs.next())
			{
				FriendPojo friendpojo=new FriendPojo();
				friendpojo.setFrom_friend(rs.getString("from_friend"));
				friendpojo.setTo_friend(rs.getString("to_friend"));
				friendpojo.setId(rs.getShort("id"));
				friendpojo.setDate(rs.getString("date"));
				friendpojo.setStatus(rs.getString("status"));
				
				
				System.out.println("...........to_friend"+rs.getString("to_friend"));
				/*studentPojo.setStudent_name(rs.getString("student_name"));
				studentPojo.setStudent_department(rs.getString("student_department"));
				studentPojo.setStudent_BE(rs.getDouble("student_BE"));*/
				
				friendList.add(friendpojo);
			}
			return friendList;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return null;
	}

	@Override
	public boolean recommendToFriend(ReccomendationPojo reccomendationPojo) {
		// TODO Auto-generated method stub
		
		Connection  conn=null;
		try {
			conn=MyConnection.getConnectionObj();
			PreparedStatement ps=conn.prepareStatement("insert into reccomendation(from_friend,to_friend,product_id) values(?,?,?)");
	
			ps.setString(1, reccomendationPojo.getFrom_friend());
			ps.setString(2, reccomendationPojo.getTo_friend());
			ps.setInt(3, reccomendationPojo.getProduct_id());
		
			
			
			int i=ps.executeUpdate();
			
			if(i>0)
			{
				System.out.println("iiiiiiiiiiiiiiiiiiiii");
				return true;
			}
			else
			{
				return false;
			}
			

		}catch (Exception e) {
		e.printStackTrace();
		}
		
		
		
		return false;
	}

	@Override
	public List<ReccomendationPojo> getProductList(String fromfriend) {
		// TODO Auto-generated method stub
		
Connection conn=null;
		
		try {
			
			conn=MyConnection.getConnectionObj();
			PreparedStatement ps=conn.prepareStatement("select * from reccomendation where to_friend=?");
			
			ps.setString(1, fromfriend);
			
			ResultSet rs=ps.executeQuery();
			List<ReccomendationPojo> productList=new ArrayList<ReccomendationPojo>();

			while(rs.next())
			{
				ReccomendationPojo rmd=new ReccomendationPojo();
				rmd.setFrom_friend(rs.getString("from_friend"));
				rmd.setId(rs.getInt("id"));
				rmd.setProduct_id(rs.getInt("product_id"));
				rmd.setTo_friend(rs.getString("to_friend"));
				
				
				System.out.println("...........to_friend"+rs.getString("to_friend"));
				
				
				productList.add(rmd);
			}
			return productList;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return null;
	}

	@Override
	public String getPassword(String fromuser) {
		// TODO Auto-generated method stub
		
		Connection conn=null;
		PreparedStatement ps=null;
		
		
		try {
			
			conn=MyConnection.getConnectionObj();
			ps=conn.prepareStatement("select password from user_table where email=?");
					
			ps.setString(1, fromuser);
			
			ResultSet rs=ps.executeQuery();
			
			if(rs.next())
			{
				String password=rs.getString("password");
				return password;
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		return null;
	}

	@Override
	public UserPojo getUser(String email) {
		// TODO Auto-generated method stub
		
		
		
		
		
		Connection conn=null;
		PreparedStatement ps=null;
		
		System.out.println("email USER IMPL"+email);
		
		try {
			conn=MyConnection.getConnectionObj();
			ps=conn.prepareStatement("select * from user_table where email=?");
			
			
			
			ps.setString(1, email);
		
			
			ResultSet rs=ps.executeQuery();
			List<UserPojo> userlist=new ArrayList<UserPojo>();
			if(rs.next())
			{
				UserPojo userPojo=new UserPojo();
				userPojo.setUser_id(rs.getInt("user_id"));
				userPojo.setUsername(rs.getString("user_name"));
				userPojo.setMobile_no(rs.getString("mobile_no"));
				userPojo.setEmail(rs.getString("email"));
				userPojo.setEmail(rs.getString("password"));
				userPojo.setLogin_status("login_status");
				return userPojo;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		

		return null;
	}

	@Override
	public int addTotalTransction(TransctionPojo transctionPojo) {
		// TODO Auto-generated method stub
		
		
		
		Connection  conn=null;
		try {
			conn=MyConnection.getConnectionObj();
			PreparedStatement ps=conn.prepareStatement("insert into transction_table(total,user_name,date) values(?,?,curdate())");
			ps.setInt(1, transctionPojo.getTotal());
			ps.setString(2, transctionPojo.getUser_name());
			
			
			
			
			int i=ps.executeUpdate();
			
			
			
			
			return i;
			

		}catch (Exception e) {
		e.printStackTrace();
		}
		
		return 0;
	}

	@Override
	public int getLastTransctionID() {
		// TODO Auto-generated method stub
 int transction_id=0;
		Connection  conn=null;
		try {
			conn=MyConnection.getConnectionObj();
			PreparedStatement ps=conn.prepareStatement("select transction_id from transction_table ORDER BY(transction_id) desc LIMIT 1");
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				transction_id=rs.getInt("transction_id");
			}
			
			return transction_id;
			
			

			

		}catch (Exception e) {
		e.printStackTrace();
		}
		return 0;
	}

	@Override
	public boolean addTransactionLine(int t_id, List<String> list) {
		// TODO Auto-generated method stub
		
		int x=0;
		System.out.println("list................"+list.size());
		Connection  conn=null;
		try {
			conn=MyConnection.getConnectionObj();
			
			for(int i=0;i<list.size();i++)
			{
			ProductDetailsDao productDetailsDao=new ProductDetailsDaoImpl();
			int pid=Integer.parseInt(list.get(i));
			System.out.println("pid..............."+pid);
			ProductCartPojo productDetail=productDetailsDao.getDetails(pid);
			int price=productDetail.getTotal_price();
			PreparedStatement ps=conn.prepareStatement("insert into transctionline_table(transction_id,product_id,prize) values(?,?,?)");
			ps.setInt(1, t_id);
			ps.setInt(2, pid);
			ps.setInt(3, price);
			
			
			
			
			x=ps.executeUpdate();
			System.out.println("ps..................."+ps);
			
			
			
			 }
			
			if(x>0)
			{
				System.out.println("iiiiiiiiiiiiiiiiiiiii");
				return true;
			}
			else
			{
				return false;
			}
		}catch (Exception e) {
		e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean addDelivery(String user, int total, String add) {
		Connection  conn=null;
		try {
			conn=MyConnection.getConnectionObj();
			PreparedStatement ps=conn.prepareStatement("insert into tbl_cod(username,total, address, date) values(?,?,?,curdate())");
			ps.setString(1, user);
			ps.setInt(2, total);
			ps.setString(3, add);
			
			
			
			int i=ps.executeUpdate();
			if(i>0)
			{
			return true;
			
			}
		}catch (Exception e) {
		e.printStackTrace();
		}
		
		
		
		return false;
	}
		
	
		
		
	

/*	@Override
	public boolean addTransactionLine(TransctionLinePojo transctionLinePojo) {
		// TODO Auto-generated method stub
		
		
		Connection  conn=null;
		try {
			conn=MyConnection.getConnectionObj();
			PreparedStatement ps=conn.prepareStatement("insert into transctionline_table(transction_id,product_id,prize) values(?,?,?)");
			ps.setInt(1, transctionLinePojo.getTransction_id());
			ps.setInt(2, transctionLinePojo.getProduct_id());
			ps.setInt(3, transctionLinePojo.getPrize());
			
			
			
			
			int i=ps.executeUpdate();
			
			if(i>0)
			{
				System.out.println("iiiiiiiiiiiiiiiiiiiii");
				return true;
			}
			else
			{
				return false;
			}
			

		}catch (Exception e) {
		e.printStackTrace();
		}
		return false;
	}
*/
	
	
}
