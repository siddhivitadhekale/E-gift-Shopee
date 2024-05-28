package com.smartshop.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.smartshop.pojo.ProductCategoryPojo;
import com.smartshop.pojo.ProductDetailsPojo;
import com.smartshop.pojo.Product_sub_categoryPojo;
import com.smartshop.pojo.ReccomendationPojo;
import com.smartshop.pojo.TransctionLinePojo;
import com.smartshop.pojo.UserPojo;
import com.smartshop.pojo.ViewPojo;


/**
 * Servlet implementation class ProductDetailsController
 */
@WebServlet("/ProductDetailsController")
public class ProductDetailsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDetailsController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		Enumeration<String> values=request.getParameterNames();
		while(values.hasMoreElements())
		{
			Object objOri=values.nextElement();
			String par=(String)objOri;
			String value=request.getParameter(par);
			System.out.println("parameter name :"+par+" parameter values :"+value);
		}
		
		
		UserDao user=new UserDaoImpl();
		HttpSession session=request.getSession();
		ProductDetailsDao productDetailsDao=new ProductDetailsDaoImpl();
		String action=request.getParameter("action");
		System.out.println("action="+action);
		if(action!=null && action.equalsIgnoreCase("searchByCategory"))
		{
			System.out.println("in action search");
			String code=request.getParameter("code");
			session.setAttribute("code", code);
			System.out.println("searchByCategory="+code);
			List<ProductDetailsPojo> productDetailsPojoList=productDetailsDao.getAllProductDetailsPojoByCategory(code);
			String sub_category=null;
			String category=null;
			
			for(int i=0;i<productDetailsPojoList.size();i++)
			{
				category=productDetailsPojoList.get(i).getCategory_code();
				sub_category=productDetailsPojoList.get(i).getProduct_sub_category();
				System.out.println("sub_category//"+sub_category);
				System.out.println("category//"+sub_category);
			}
			session.setAttribute("productDetailsPojoList", productDetailsPojoList);
			Map<String,List<ProductCategoryPojo>> productCategoryList=productDetailsDao.getAllProductCategory();
			session.setAttribute("productCategoryList", productCategoryList);
			System.out.println("productCategoryList"+productCategoryList.size());
			System.out.println("productDetailsPojoList"+productDetailsPojoList.size());
			System.out.println("sub_category..................//"+sub_category);
			/*if(sub_category!=null)
			{
				
				response.sendRedirect("ProductDetailsController?action=subctegorylist&category="+category);
				//response.sendRedirect("mens.html");
			}*/
			////else
			//{
				response.sendRedirect("productListing.jsp");
				
			//}
		}
		
		/*else if(action!=null && action.equalsIgnoreCase("searchBySubCategory"))
		{
			String code=request.getParameter("code");
			session.setAttribute("code", code);
			System.out.println("searchByCategory="+code);
		}*/
		else  if(action!=null && action.equalsIgnoreCase("searchBySubCategory"))
		{
			String subcode=request.getParameter("code");
			System.out.println("subcategory::"+subcode);
			System.out.println("searchBySubCategory="+subcode);
			List<ProductDetailsPojo> productDetailsPojoList=productDetailsDao.getAllProductDetailsPojoBySubCategory(subcode);
			session.setAttribute("productDetailsPojoList", productDetailsPojoList);
			response.sendRedirect("productListing.jsp");
			
		}
		
		else  if(action!=null && action.equalsIgnoreCase("subCtegoryList"))
		{
		System.out.println("in subCtegoryList");
		String cat=request.getParameter("category");
		System.out.println("cat"+cat);
		List<Product_sub_categoryPojo> subCategoryPojoList=productDetailsDao.getAllSubCategory(cat);
		List<ProductDetailsPojo> productDetailsPojoList=productDetailsDao.getAllProductDetailsPojoByCategory(cat);
		session.setAttribute("productDetailsPojoList", productDetailsPojoList);
		for(int i=0;i<subCategoryPojoList.size();i++)
		{
			String sub_category=subCategoryPojoList.get(i).getSub_category_desc();
			//session.setAttribute("subCategoryPojoList", subCategoryPojoList);
			System.out.println("sub_category............."+sub_category);
		}
		session.setAttribute("subCategoryPojoList", subCategoryPojoList);
		response.sendRedirect("subCategory.jsp");
		}
		
		else  if(action!=null && action.equalsIgnoreCase("productDescription"))
		{
			String id=request.getParameter("id");
			System.out.println("id"+id);
			if(id.equalsIgnoreCase(""))
			{
				response.sendRedirect("index.jsp");
			}
			else
			{
			ProductDetailsPojo productDetailsPojo=productDetailsDao.getProductByCode(Integer.parseInt(id));
			
			session.setAttribute("productDetailsPojo", productDetailsPojo);
			List<ProductDetailsPojo> productDetailsPojoList=productDetailsDao.getAllProductDetailsPojo();
			
			session.setAttribute("productDetailsPojoList", productDetailsPojoList);
			Map<String,List<ProductCategoryPojo>> productCategoryList=productDetailsDao.getAllProductCategory();
			session.setAttribute("productCategoryList", productCategoryList);
		
			System.out.println("productCategoryList"+productCategoryList.size());
			System.out.println("productDetailsPojoList"+productDetailsPojoList.size());
			
			
			//List<ProductDetailsPojo> productDetailsPojoList1=productDetailsDao.getAllProductByApriori(Integer.parseInt(id));
			
			response.sendRedirect("ProductDetailsController?action=productView&pid="+id);
				//response.sendRedirect("productDetail.jsp");
			}
			
		}
		
		
		
		else  if(action!=null && action.equalsIgnoreCase("productView"))
		{
			String id=request.getParameter("pid");
			String userid=(String) session.getAttribute("email");
			System.out.println("........product_id"+id);
			Cookie cookie=new Cookie("Prod"+id,id);
			cookie.setMaxAge(60*60*24*5);
			response.addCookie(cookie);
			
			ViewPojo viewPojo=new ViewPojo();
			viewPojo.setProduct_id(Integer.parseInt(id));
			viewPojo.setUser_id(userid);
			
			
			List <ProductDetailsPojo>productList=new ArrayList<ProductDetailsPojo>();
			
			Cookie[] cookies=request.getCookies();
			for(int i=0;i<cookies.length;i++)
			{
				Cookie coo=cookies[i];
				System.out.println("Session id"+coo.getName()+" "+coo.getValue());
				if(coo.getName().startsWith("Prod")){
				int productid=Integer.parseInt(coo.getValue());

				ProductDetailsPojo productDetailsPojo1=productDetailsDao.getProductByCode(productid);
				productList.add(productDetailsPojo1);
				}
			}
			int productListCount=productList.size();
			System.out.println("ssssssssssssss"+productList.size());
			
			//List<TransctionLinePojo> transctionProductList=productDetailsDao.getAllDistinctProduct();
			//System.out.println("transctionProductList.................size"+transctionProductList.size());
		
		
			session.setAttribute("productListCount", productListCount);
			session.setAttribute("productList", productList);
			
			
			
			
		     
			boolean x=productDetailsDao.addToView(viewPojo);
			if(x)
			{
				List<ProductDetailsPojo> productDetailsPojoList1=productDetailsDao.getAllProductByApriori(Integer.parseInt(id));
				session.setAttribute("productDetailsPojoList1", productDetailsPojoList1);
				response.sendRedirect("productDetail.jsp");
			}
			else
			{
				response.sendRedirect("index.jsp");
			}
			
			
			
		}
		
		
		
		else  if(action!=null && (action.equalsIgnoreCase("login") || action.equalsIgnoreCase("registration")))
		{
			//String id=request.getParameter("id");
			//ProductDetailsPojo productDetailsPojo=productDetailsDao.getProductByCode(Integer.parseInt(id));
			//session.setAttribute("productDetailsPojo", productDetailsPojo);
			List<ProductDetailsPojo> productDetailsPojoList=productDetailsDao.getAllProductDetailsPojo();
			session.setAttribute("productDetailsPojoList", productDetailsPojoList);
			Map<String,List<ProductCategoryPojo>> productCategoryList=productDetailsDao.getAllProductCategory();
			session.setAttribute("productCategoryList", productCategoryList);
			System.out.println("productCategoryList"+productCategoryList.size());
			System.out.println("productDetailsPojoList"+productDetailsPojoList.size());
			
			
			response.sendRedirect("login.jsp");
		}
		
		else  if(action!=null && action.equalsIgnoreCase("addToCart"))
		{
			int id=Integer.parseInt(request.getParameter("id"));
			int quantity=Integer.parseInt(request.getParameter("quantity"));
			int price=Integer.parseInt(request.getParameter("price"));
			
			String email=(String) session.getAttribute("email");
			System.out.println("email"+email);
			System.out.println("quantity"+quantity);
			System.out.println("price"+price);
			System.out.println("id"+id);
			int totalPrice=quantity*price;
			System.out.println("totalPrice"+totalPrice);
			ProductCartPojo productCartPojo=new ProductCartPojo();
			
			productCartPojo.setProduct_id(id);
			productCartPojo.setQuantity(quantity);
			productCartPojo.setPrice(price);
		productCartPojo.setUsername(email);
			
			productCartPojo.setTotal_price(totalPrice);
			
			
			boolean x=productDetailsDao.addToCart(productCartPojo);
			
			List<ProductCartPojo> productCartList=user.getCartListByUid(email);
			session.setAttribute("productCartList", productCartList);
			int cartlistsize=productCartList.size();
			session.setAttribute("cartlistsize", cartlistsize);
			System.out.println("productCartList........."+productCartList.size());
			
			if(x)
			{
				response.sendRedirect("productListing.jsp");
			}
			else
			{
				response.sendRedirect("index.jsp");
			}
			
			
			//response.sendRedirect("productDetail.jsp");
		}
		
		else if(action!=null && action.equals("cartList"))
		{
			String userid=request.getParameter("user_id");
			System.out.println("userid"+userid);
			List<ProductCartPojo> productCartList=user.getCartListByUid(userid);
			System.out.println("product"+productCartList.size());
			
			int totalprice=0;
			for(int i=0;i<productCartList.size();i++)
			{
				int price=productCartList.get(i).getTotal_price();
				totalprice=totalprice+price;
			}
			
			System.out.println("totalprice.................."+totalprice);
			session.setAttribute("totalprice", totalprice);
			session.setAttribute("productCartList", productCartList);
			int cartlistsize=productCartList.size();
			session.setAttribute("cartlistsize", cartlistsize);
			
			response.sendRedirect("cartList1.jsp");
		
		}
		
		else if(action!=null && action.equals("lastViewByUser"))
		{
			String userid=request.getParameter("user_id");
			
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
			System.out.println("ssssssssssssss"+productList.size());
		
			List<ViewPojo> productViewList=user.getLastViewByUid(userid);
			session.setAttribute("productList", productList);
			
			//response.sendRedirect("index.jsp");
		}
		
		else if(action!=null && action.equals("recommendation"))
		{
			String user_id=request.getParameter("user_id");
			System.out.println("user_id/////////////"+user_id);
			
			ReccomendationPojo rmd=new ReccomendationPojo();
			List<ReccomendationPojo> productList=user.getProductList(user_id);
			List<ProductDetailsPojo> list=new ArrayList<ProductDetailsPojo>();
			System.out.println("productList size"+productList.size());
			for(int i=0;i<productList.size();i++)
			{
				int productid=productList.get(i).getProduct_id();
				String  fromuser=productList.get(i).getFrom_friend();
				
				ProductDetailsPojo product=productDetailsDao.getProductByCode(productid);
				list.add(product);
			}
			
			
			System.out.println("list size"+list.size());
			session.setAttribute("list", list);
			
			response.sendRedirect("recommendation.jsp");
			
		}
		
		
		else
		{
		List<ProductDetailsPojo> productDetailsPojoList=productDetailsDao.getAllProductDetailsPojo();
		session.setAttribute("productDetailsPojoList", productDetailsPojoList);
		Map<String,List<ProductCategoryPojo>> productCategoryList=productDetailsDao.getAllProductCategory();
		session.setAttribute("productCategoryList", productCategoryList);
		System.out.println("productCategoryList"+productCategoryList.size());
		
		System.out.println("productDetailsPojoList"+productDetailsPojoList.size());
		
		List <ProductDetailsPojo>productList=new ArrayList<ProductDetailsPojo>();
		
		//List<Product_sub_categoryPojo> subcategoryList=productDetailsDao.getAllsubcategory();
		//System.out.println("subcategoryList size"+subcategoryList.size());
		
		Map<String,List<Product_sub_categoryPojo>> subcategoryList=productDetailsDao.getAllsubcategory();
		System.out.println("subcategoryListsize.............."+subcategoryList.size());
		session.setAttribute("subcategoryList", subcategoryList);
		/*Map<String,String> subcategory=new HashMap<String, String>();
		for(int i=0;i<subcategoryList.size();i++)
		{
		subcategory.put(subcategoryList.get(i).getCategory_code(), subcategoryList.get(i).getSub_category_desc());
		}*/
		Cookie[] cookies=request.getCookies();
		if(cookies!=null && cookies.length>0){
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
		}
		int productListCount=productList.size();
		System.out.println("ssssssssssssss"+productList.size());
	
		session.setAttribute("productListCount", productListCount);
	
		
		session.setAttribute("productList", productList);
		
		
		
		response.sendRedirect("index.jsp");
		}
	
		
		
		
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		String action=request.getParameter("action");
		System.out.println("actipn"+action);
		ProductDetailsDao productDetailsDao=new ProductDetailsDaoImpl();
		
			if (action != null && action.equalsIgnoreCase("deleteProductFromCart")) {
			
			int id =Integer.parseInt(request.getParameter("rowID"));
			System.out.println("id"+id);
			String userid=(String) session.getAttribute("email");
			
			System.out.println("...userid"+userid);
			boolean b = productDetailsDao.deleteProductById(id);
			System.out.println("servlet boolean"+b);
			if (b)
				response.sendRedirect("ProductDetailsController?action=cartList&user_id="+userid);
			else
				response.sendRedirect("Login.jsp");
		}
			
			else if(action!= null && action.equalsIgnoreCase("productList"))
			{
				
				String query=request.getParameter("searchString");
				System.out.println("alpha::"+query);
				List<ProductDetailsPojo> list=productDetailsDao.allProductOnPattern(query);
				System.out.println("product"+list);
			    PrintWriter out=response.getWriter();
			    String json = new Gson().toJson(list); 
				response.setContentType("application/json"); 
				response.setCharacterEncoding("UTF-8"); 
				out.write(json);
			}
			
			else  if(action!=null && action.equalsIgnoreCase("productDetail"))
			{
				
				
				
				String id=request.getParameter("id");
				System.out.println("id"+id);
				ProductDetailsPojo productDetailsPojo=productDetailsDao.getProductByCode(Integer.parseInt(id));
				
				session.setAttribute("productDetailsPojo", productDetailsPojo);
				List<ProductDetailsPojo> productDetailsPojoList=productDetailsDao.getAllProductDetailsPojo();
				
				session.setAttribute("productDetailsPojoList", productDetailsPojoList);
				Map<String,List<ProductCategoryPojo>> productCategoryList=productDetailsDao.getAllProductCategory();
				session.setAttribute("productCategoryList", productCategoryList);
			
				System.out.println("productCategoryList"+productCategoryList.size());
				System.out.println("productDetailsPojoList"+productDetailsPojoList.size());
				
				
				
				
				
			
				response.sendRedirect("ProductDetailsController?action=productView&pid="+id);
					//response.sendRedirect("productDetail.jsp");
			
				
			}
			
	}
}