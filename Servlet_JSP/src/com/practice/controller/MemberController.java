package com.practice.controller;

import com.practice.action.Action;
import com.practice.action.ActionForward;
import com.practice.action.MemberJoinACtion;
import com.practice.action.MemberLoginAction;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "MemberController")
public class MemberController extends HttpServlet {

    public void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String RequestURL = request.getRequestURI();
        String contextPath = request.getContextPath();
        String command = RequestURL.substring(contextPath.length());

        ActionForward forward = null;
        Action action = null;

        if(command.equals("/login.go")) {
            forward = new ActionForward();

            forward.setRedirect(false);
            forward.setPath("loginForm.html");
        }
        else if(command.equals("/loginAction.go")) {
            action = new MemberLoginAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        else if(command.equals("/join.go")) {
            forward = new ActionForward();
            forward.setRedirect(false);
            forward.setPath("joinForm.html");
        }
        else if(command.equals("/joinAction.go")) {
            action = new MemberJoinACtion();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if(forward.isRedirect()) {
            response.sendRedirect(forward.getPath());
        }
        else {
            RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
            dispatcher.forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }
}
