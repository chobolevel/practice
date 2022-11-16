package com.practice.action;

import com.practice.member.Member;
import com.practice.member.MemberDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

public class MemberLoginAction extends ActionForward implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset-UTF-8");
        HttpSession session = request.getSession();

        Member member = new Member();
        MemberDAO memberDAO = new MemberDAO();
        ActionForward forward = new ActionForward();

        PrintWriter out;
        int result = 0;
        member.setId(request.getParameter("id"));
        member.setPassword(request.getParameter("password"));
        
        result = memberDAO.isMember(member);
        if(result == 1) {
            //로그인 성공
            session.setAttribute("id", member.getId());
            forward.setRedirect(true);
            forward.setPath("/");
            return forward;
        }
        else if(result == 0) {
            //DB오류
            out = response.getWriter();
            out.println("<script>");
            out.println("alert('데이터베이스 오류 발생!');");
            out.println("location.href='loginForm.html';");
            out.println("</script>");
        }
        else if(result == -1) {
            //아이디 존재하지 않음
            out = response.getWriter();
            out.println("<script>");
            out.println("alert('아이디가 존재하지 않습니다!');");
            out.println("location.href='loginForm.html';");
            out.println("</script>");
        }
        else if(result == -2) {
            //비밀번호 올바르지 않음
            out = response.getWriter();
            out.println("<script>");
            out.println("alert('비밀번호가 올바르지 않습니다!');");
            out.println("location.href='loginForm.html';");
            out.println("</script>");
        }

        return null;
    }
}
