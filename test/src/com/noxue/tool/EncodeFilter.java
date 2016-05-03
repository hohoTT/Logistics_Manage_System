package com.noxue.tool;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.*;

public class EncodeFilter implements Filter {

	private FilterConfig filterconfig;
	private FilterChain chain;
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	
	public void destroy() {
		// TODO Auto-generated method stub
		this.filterconfig = null;
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		chain.doFilter(request, response);
	}

	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		this.filterconfig = filterConfig;
	}

}
