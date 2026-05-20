package com.landf.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Optional;

import com.auth0.jwt.interfaces.DecodedJWT;
import com.landf.dao.ReportDAO;
import com.landf.features.auth.JwtService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "reportServlet", value = "/reports")
public class ReportServlet extends HttpServlet {

    private final JwtService jwtService = new JwtService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Optional<DecodedJWT> jwt = jwtService.resolveToken(request).flatMap(jwtService::verify);
        if (jwt.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/auth/login");
            return;
        }
        jwtService.applyClaimsToRequest(jwt.get(), request);

        String targetType = request.getParameter("targetType");
        String targetIdStr = request.getParameter("targetId");

        request.setAttribute("targetType", targetType == null ? "item" : targetType);
        request.setAttribute("targetId", targetIdStr == null ? "" : targetIdStr);

        request.getRequestDispatcher("/pages/user_pages/systemReportPage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Optional<DecodedJWT> jwt = jwtService.resolveToken(request).flatMap(jwtService::verify);
        if (jwt.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/auth/login");
            return;
        }
        jwtService.applyClaimsToRequest(jwt.get(), request);
        int userId = jwt.get().getClaim("userId").asInt();

        String targetType = request.getParameter("targetType");
        String targetIdStr = request.getParameter("targetId");
        String reason = request.getParameter("reason");
        String details = request.getParameter("details");

        if (targetType == null || targetType.isEmpty() || targetIdStr == null || targetIdStr.isEmpty() ||
            reason == null || reason.isBlank() || details == null || details.isBlank()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing required report fields");
            return;
        }

        try {
            int targetId = Integer.parseInt(targetIdStr);
            ReportDAO.createReport(userId, targetType.trim(), targetId, reason.trim(), details.trim());

            if ("item".equalsIgnoreCase(targetType)) {
                response.sendRedirect(request.getContextPath() + "/item-detail?id=" + targetId + "&status=report_success");
            } else {
                response.sendRedirect(request.getContextPath() + "/dashboard?status=report_success");
            }

        } catch (NumberFormatException | SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error submitting report");
        }
    }
}
