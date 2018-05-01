package com.auth0.example.mvc;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.Map;

@SuppressWarnings("unused")
@Controller


public class AdminController {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @RequestMapping(value = "/portal/admin", method = RequestMethod.GET)
    protected String home(final Map<String, Object> model, final Principal principal) {
        logger.info("Home page");
        if (principal == null) {
            return "redirect:/logout";
        }
        model.put("userId", principal);
        logger.info("===================================ADMIN - PRINCIPAL============================="+principal.toString());

        //according to application properties this will return to value+.jsp
        return "admin";
    }

}

