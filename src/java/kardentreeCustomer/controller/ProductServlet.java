/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kardentreeCustomer.controller;

import java.io.IOException;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.UserTransaction;
import kardentreeAdmin.jpa.controller.ProductJpaController;
import kardentreeAdmin.jpa.models.Product;
import kardentreeCustomer.jpa.controller.CategoryJpaController;
import kardentreeCustomer.jpa.models.Category;

/**
 *
 * @author ryan.
 */
public class ProductServlet extends HttpServlet {

    @PersistenceUnit(unitName = "KardenTreePU")
    EntityManagerFactory emf;

    @Resource
    UserTransaction utx;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String category = request.getParameter("category");

        ProductJpaController productJpa = new ProductJpaController(utx, emf);
        List<Product> product = productJpa.findProductEntities();
        String uri = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
        CategoryJpaController categoryJpa = new CategoryJpaController(utx, emf);
        List<Category> categoryList = categoryJpa.findCategoryEntities();

        if (category != null) {
            List<Product> productCategory = productJpa.findProductCategory(category);

            if (productCategory != null) {
                request.setAttribute("URL", uri);
                request.setAttribute("productcategory", productCategory);
                request.setAttribute("category", categoryList);
                getServletContext().getRequestDispatcher("/ProductListByCategory.jsp").forward(request, response);
            }
        }

        //ViewProduct
        if (request.getParameter("view") != null) {

            Product productView = productJpa.findProduct(request.getParameter("view"));

            if (productView != null) {
                request.setAttribute("URL", uri);
                request.setAttribute("productAll", product);
                request.setAttribute("ProductView", productView);
                getServletContext().getRequestDispatcher("/ProductInfo.jsp").forward(request, response);
                return;
            }
        }

        if (request.getParameter("search") != null) {

            List<Product> productSearchByName = productJpa.SearchByName(request.getParameter("search"));

            if (productSearchByName != null) {
                request.setAttribute("URL", uri);
                request.setAttribute("OKSearch", "1");
                request.setAttribute("ProductSearch", productSearchByName);
            }

        }

        //SortBy
        if (request.getParameter("SortBy") != null) {
            System.out.println(request.getParameter("SortBy"));
            List<Product> productSort = productJpa.SortBy(request.getParameter("SortBy"));
            request.setAttribute("URL", uri);
            request.setAttribute("product", productSort);
            getServletContext().getRequestDispatcher("/ProductList.jsp").forward(request, response);
            return;
        }

        request.setAttribute("URL", uri);
        request.setAttribute("product", product);
        request.setAttribute("category", categoryList);
        getServletContext().getRequestDispatcher("/ProductList.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
