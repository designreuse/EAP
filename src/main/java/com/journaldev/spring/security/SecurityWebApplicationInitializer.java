package com.journaldev.spring.security;

import org.springframework.security.web.context.*;
/**
 * Created by Tianshan on 2016/7/22.
 */
public class SecurityWebApplicationInitializer
        extends AbstractSecurityWebApplicationInitializer {

    public SecurityWebApplicationInitializer() {
        super(SecurityConfig.class);
    }
}
