package com.practice.action;

import com.practice.member.Member;
import com.practice.member.MemberDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberJoinACtion extends ActionForward implements Action{
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        Member member = new Member();
        MemberDAO memberDAO = new MemberDAO();
        ActionForward forward = new ActionForward();
        int result = 0;

        try {
            member.setId(request.getParameter("id"));
            member.setPassword(request.getParameter("password"));
            member.setName(request.getParameter("name"));
            member.setGender(Integer.parseInt(request.getParameter("gender")));
            member.setEmail(request.getParameter("email"));
            member.setTel(Integer.parseInt(request.getParameter("tel")));
            result = memberDAO.insertMember(member);
            if(result == -1) {
                System.out.println("회원 등록 실패");
                return null;
            }
            System.out.println("회원 등록 성공");
            forward.setRedirect(true);
            forward.setPath("/");
            return forward;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}
