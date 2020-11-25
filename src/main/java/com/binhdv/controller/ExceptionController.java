package com.binhdv.controller;

import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.NoHandlerFoundException;

import javax.servlet.http.HttpServletRequest;

@ControllerAdvice
public class ExceptionController {

    private static Logger logger = Logger.getLogger(ExceptionController.class);

    @ExceptionHandler(value = NoHandlerFoundException.class)
    public String error404(Exception e){
        logger.error(e);
        return "error/404";
    }

    @ExceptionHandler(value = Exception.class)
    public String allException(HttpServletRequest request, Exception e){
        logger.error(e);
        request.setAttribute("errMessage", e.getMessage());
        return "error/error";
    }


}
