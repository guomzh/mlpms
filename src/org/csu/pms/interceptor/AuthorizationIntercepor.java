package org.csu.pms.interceptor;
import org.csu.pms.domain.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by zgm on 2017/8/28.
 */
public class AuthorizationIntercepor implements HandlerInterceptor {
    /*private static final String[]Ignore={"/loginForm","/login"};*/
    @Override
    public boolean preHandle(HttpServletRequest request , HttpServletResponse response, Object handler)throws Exception{
        boolean flag=false;
      /*  String servletPath=request.getServletPath();
         for(String s:Ignore){
             if(servletPath.contains(s)){
                 flag=true;
                 break;
             }
         }*/
         if(!flag){
             User user=(User)request.getSession().getAttribute("user");
             if(user==null){
                 request.setAttribute("errorMessage","请先登录，才能为您服务");
                 request.getRequestDispatcher("index").forward(request,response);
             }
             else {
                 flag=true;
             }
         }
        return flag;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
