package com.smartshop.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smartshop.dao.ProductDetailsDao;
import com.smartshop.dao.ProductDetailsDaoImpl;
import com.smartshop.dao.UserDao;
import com.smartshop.dao.UserDaoImpl;
import com.smartshop.pojo.FriendPojo;
import com.smartshop.pojo.ProductCartPojo;
import com.smartshop.pojo.ProductDetailsPojo;
import com.smartshop.pojo.ReccomendationPojo;
import com.smartshop.pojo.TransctionPojo;
import com.smartshop.pojo.UserPojo;
import com.smartshop.pojo.ViewPojo;
import com.smartshop.util.EmailUtility;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
      // private double totalprice;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    
   /* public void init() throws ServletException {
    	 totalprice =0.0;
    	}*/

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		String action=request.getParameter("action");
		System.out.println("action.."+action);
		UserDao user=new UserDaoImpl();
		/*if(action!=null && action.equals("userList"))
		{
			String userid=request.getParameter("user_id");
			
			List<UserPojo> useList=user.getUserList(userid);
			session.setAttribute("useList", useList);
			
			response.sendRedirect("suggestion.jsp");
		}*/
	
		 if(action!=null && action.equals("sendFriendRequest"))
		{
			String fromfriend=request.getParameter("from_friend");
			
			String to_friend=request.getParameter("to_friend");
			System.out.println("to_friend/////"+to_friend);
			System.out.println("from userid....."+fromfriend);
			
			UserPojo userPojo=user.getUserById(fromfriend);
			
			String email=userPojo.getEmail();
			System.out.println("email____________"+email);
			
			
			FriendPojo friendpojo=new FriendPojo();
			friendpojo.setFrom_friend(email);
			friendpojo.setTo_friend(to_friend);
			
			boolean x=user.sendRequest(friendpojo);
			if(x)
			{
				response.sendRedirect("suggestion.jsp");
			}
			else
			{
				response.sendRedirect("index.jsp");
			}
			
			
			
		}
		 
		 doPost(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		HttpSession session=request.getSession();
		String action=request.getParameter("action");
		System.out.println("action"+action);
		UserDao user=new UserDaoImpl();
		ProductDetailsDao productDetailsDao=new ProductDetailsDaoImpl();
		
		if(action!=null && action.equals("REGISTER"))
		{
			String username=request.getParameter("username");
			String mobile=request.getParameter("mobile");
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			System.out.println("username"+username);
			System.out.println("mobile"+mobile);
			
			UserPojo userPojo=new UserPojo();
			userPojo.setUsername(username);
			userPojo.setMobile_no(mobile);
			userPojo.setEmail(email);
			userPojo.setPassword(password);
			 String hostval = "pop.gmail.com";
		      String mailStrProt = "pop3";
			
			boolean x=user.registeruser(userPojo);
			if(x)
			{
				EmailUtility emailUtility=new EmailUtility();
				//emailUtility.sendEmailUtil(email,password);
				emailUtility.checkMail(hostval,  mailStrProt, email, password);
				response.sendRedirect("login.jsp");
			}
			else
			{
				response.sendRedirect("index.jsp");
			}
		}
		else if(action!=null && action.equals("SIGNIN"))
		{
			
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			
			UserPojo userPojo=new UserPojo();
			userPojo.setEmail(email);
			userPojo.setPassword(password);
			
			
			
			UserPojo x=user.login(email, password);
			
			
			List <ProductDetailsPojo>productList=new ArrayList<ProductDetailsPojo>();
			
			Cookie[] cookies=request.getCookies();
			for(int i=0;i<cookies.length;i++)
			{
				Cookie coo=cookies[i];
				System.out.println("Session id"+coo.getName()+" "+coo.getValue());
				if(coo.getName().startsWith("Prod")){
				int productid=Integer.parseInt(coo.getValue());

				ProductDetailsPojo productDetailsPojo=productDetailsDao.getProductByCode(productid);
				productList.add(productDetailsPojo);
				}
			}
			int productListCount=productList.size();
			System.out.println("ssssssssssssss"+productList.size());
		
			session.setAttribute("productListCount", productListCount);
		
			
			session.setAttribute("productList", productList);
			
			
			
				if(x != null)
				{
					int user_id=x.getUser_id();
					session.setAttribute("user_id", user_id);
					session.setAttribute("email", email);
					session.setAttribute("password", password);
					System.out.println("user_id"+user_id);
					
					List<ProductCartPojo> productCartList=user.getCartListByUid(email);
					session.setAttribute("productCartList", productCartList);
					int cartlistsize=productCartList.size();
					session.setAttribute("cartlistsize", cartlistsize);
					System.out.println("productCartList........."+productCartList.size());
					
					
					
					
					ReccomendationPojo rmd=new ReccomendationPojo();
					List<ReccomendationPojo> productList1=user.getProductList(email);
					List<ProductDetailsPojo> list=new ArrayList<ProductDetailsPojo>();
					System.out.println("productList size"+productList1.size());
					for(int i=0;i<productList1.size();i++)
					{
						int productid=productList1.get(i).getProduct_id();
						String  fromuser=productList1.get(i).getFrom_friend();
						
						ProductDetailsPojo product=productDetailsDao.getProductByCode(productid);
						list.add(product);
					}
					
					
					System.out.println("list size"+list.size());
					session.setAttribute("list", list);
					
					
					
					
					response.sendRedirect("index.jsp");
				}
				else
				{
					
					
						request.setAttribute("error", "Your Username  Or Password is Wrong..!");
						RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
						rd.include(request, response);
						/*response.sendRedirect("login.jsp");*/
						/*PrintWriter out = response.getWriter();
						out.println("Wrong");*/
					
					
					//response.sendRedirect("login.jsp");
				}
			
		}
		
		else if(action!=null && action.equals("userList"))
		{
			String userid=request.getParameter("user_id");
			
			List<FriendPojo> useList=user.getUserList(userid);
			session.setAttribute("useList", useList);
			
			
			PrintWriter out = response.getWriter(); 
			String json = new Gson().toJson(useList); 
			response.setContentType("application/json"); 
			response.setCharacterEncoding("UTF-8"); 
			out.write(json);
			
			//response.sendRedirect("suggestion.jsp");
		}
		
		else if(action!=null && action.equals("checkOut"))
		{
			
			String fromuser=request.getParameter("from_user");
			session.setAttribute("fromuser", fromuser);
			System.out.println("fromuser"+fromuser);
			String[] productid = request.getParameterValues("Checkproduct");
			List<String> list =  Arrays.asList(productid); 
			session.setAttribute("plist", list);
			System.out.println("list.size()"+list.size());
			int totalprice=0;
			for(int i=0;i<list.size();i++)
			{
				//System.out.println("product id"+list.get(i));
				int pid=Integer.parseInt(list.get(i));
				System.out.println("pid"+pid);
				ProductCartPojo product=new ProductCartPojo();
				product.setProduct_id(pid);
				
				ProductCartPojo productDetail=productDetailsDao.getDetails(pid);
				int price=productDetail.getTotal_price();
				int price1=productDetail.getPrice();
				System.out.println("price"+price);
				System.out.println("price1"+price1);
				totalprice=totalprice+price;
				session.setAttribute("totalprice", totalprice);
				
				System.out.println("totalprice"+totalprice);
				session.setAttribute("totalprice", totalprice);
				
				
			}
			response.sendRedirect("payment1.jsp");
		}
		else if(action!=null && action.equalsIgnoreCase("pay"))
		{
			int totalprice1=(Integer) session.getAttribute("totalprice");
			System.out.println("totalprice1............"+totalprice1);
			
			TransctionPojo transctionPojo=new TransctionPojo();
			String fuser = (String)session.getAttribute("fromuser");
			transctionPojo.setUser_name(fuser);
			transctionPojo.setTotal(totalprice1);
			
			
			int t_id=user.addTotalTransction(transctionPojo);
			
			int  tid = user.getLastTransctionID();
			System.out.println("tiddd"+tid);
			
		if(tid>0)
			{
			List<String> pidList=(List<String>) session.getAttribute("plist");
			System.out.println("pidd"+pidList.size());
			List<ProductCartPojo> transctionProductList=new ArrayList<ProductCartPojo>();
			for(int i=0;i<pidList.size();i++)
			{
					int pid=Integer.parseInt(pidList.get(i));
					System.out.println("pid.................."+pid);
					
					
				
					ProductCartPojo productDetail=productDetailsDao.getDetails(pid);
					System.out.println("ppp"+productDetail.getId());
					transctionProductList.add(productDetail);
					boolean b = productDetailsDao.deleteProductByProductId(pid);
			}
			session.setAttribute("transctionProductList", transctionProductList);	
			System.out.println("transctionProductList"+transctionProductList.size());
			
			EmailUtility.sendInvoice(fuser, "Invoice", "total price is"+totalprice1);
			
			
			
			response.sendRedirect("bill.jsp");
			}
		}
			
		else if(action!=null && action.equalsIgnoreCase("Add"))
		{
			int totalprice1=(Integer) session.getAttribute("totalprice");
			System.out.println("totalprice1............"+totalprice1);
			String address = request.getParameter("address");
			System.out.println("totalprice1............"+address);
			String fuser = (String)session.getAttribute("fromuser");
			user.addDelivery(fuser, totalprice1, address);
			EmailUtility.sendInvoice(fuser, "Cash on Delivery", "We Will Deliver to address:"+address);
			
			List<String> pidList=(List<String>) session.getAttribute("plist");
			List<ProductCartPojo> transctionProductList=new ArrayList<ProductCartPojo>();
			for(int i=0;i<pidList.size();i++)
			{
					int pid=Integer.parseInt(pidList.get(i));
					System.out.println("pid.................."+pid);
					
					
				
					ProductCartPojo productDetail=productDetailsDao.getDetails(pid);
					System.out.println("ppp"+productDetail.getId());
					transctionProductList.add(productDetail);
					boolean b = productDetailsDao.deleteProductByProductId(pid);
			}
			
			
			
			response.sendRedirect("bill.jsp");
			
			
			
		}
		

		
		else if(action!=null && action.equals("recommendToFriend"))
		{
			String fromuser=request.getParameter("fromuser");
			String password=user.getPassword(fromuser);
			int productid=Integer.parseInt(request.getParameter("productid"));
			String to_friend=request.getParameter("to_friend");
			
			System.out.println("fromuser"+fromuser);
			System.out.println("productid"+productid);
			System.out.println("to_friend"+to_friend);
			
			ReccomendationPojo rmd=new ReccomendationPojo();
			rmd.setFrom_friend(fromuser);
			rmd.setProduct_id(productid);
			rmd.setTo_friend(to_friend);
			ProductDetailsDao productDetailsDao2 = new ProductDetailsDaoImpl();
			ProductDetailsPojo productCartPojo=new ProductDetailsPojo();
			productCartPojo=productDetailsDao2.getProductByCode(productid);
			String productName =productCartPojo.getProduct_name();
			
			EmailUtility emailUtility=new EmailUtility();
			emailUtility.sendEmailNotification(fromuser,to_friend,password,productName);
			boolean x=user.recommendToFriend(rmd);
			
			PrintWriter out = response.getWriter(); 
			String json = new Gson().toJson(x); 
			response.setContentType("application/json"); 
			response.setCharacterEncoding("UTF-8"); 
			out.write(json);
			/*if(x)
			{
				response.sendRedirect("cartList1.jsp");
			}*/
			/*else
			{
				response.sendRedirect("index.jsp");
			}*/
			
			/*List<FriendPojo> useList=user.getUserList(userid);
			session.setAttribute("useList", useList);
			
			
			PrintWriter out = response.getWriter(); 
			String json = new Gson().toJson(useList); 
			response.setContentType("application/json"); 
			response.setCharacterEncoding("UTF-8"); 
			out.write(json);*/
			
			//response.sendRedirect("suggestion.jsp");
		}
		
		/*else if(action!=null && action.equals("cartList"))
		{
			String userid=request.getParameter("user_id");
			
			List<ProductCartPojo> productCartList=user.getCartListByUid(userid);
			session.setAttribute("productCartList", productCartList);
			
			response.sendRedirect("checkout.html");
		}*/
	}

}
