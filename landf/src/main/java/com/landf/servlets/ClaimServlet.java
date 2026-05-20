package com.landf.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Optional;

import com.auth0.jwt.interfaces.DecodedJWT;
import com.landf.dao.ClaimDAO;
import com.landf.dao.ItemDAO;
import com.landf.models.Item;
import com.landf.features.auth.JwtService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "claimServlet", value = "/items/claim")
public class ClaimServlet extends HttpServlet {

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

        String itemIdStr = request.getParameter("itemId");
        if (itemIdStr == null || itemIdStr.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Item ID is required");
            return;
        }

        try {
            int itemId = Integer.parseInt(itemIdStr);
            Item item = ItemDAO.getItemById(itemId);

            if (item == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Item not found");
                return;
            }

            if (!"found".equalsIgnoreCase(item.getType())) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Only found items can be claimed");
                return;
            }

            request.setAttribute("item", item);
            request.getRequestDispatcher("/pages/user_pages/claimItemPage.jsp").forward(request, response);

        } catch (NumberFormatException | SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database or validation error");
        }
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

        String itemIdStr = request.getParameter("itemId");
        String proof = request.getParameter("proof");
        String identifiers = request.getParameter("identifiers");

        if (itemIdStr == null || itemIdStr.isEmpty() || proof == null || proof.isBlank()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Item ID and proof are required");
            return;
        }

        try {
            int itemId = Integer.parseInt(itemIdStr);
            ClaimDAO.createClaim(itemId, userId, proof.trim(), identifiers == null ? "" : identifiers.trim());

            response.sendRedirect(request.getContextPath() + "/item-detail?id=" + itemId + "&status=claim_success");

        } catch (NumberFormatException | SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error submitting claim");
        }
    }
}
