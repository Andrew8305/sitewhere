/*
 * Copyright (c) SiteWhere, LLC. All rights reserved. http://www.sitewhere.com
 *
 * The software in this package is published under the terms of the CPAL v1.0
 * license, a copy of which has been included with this distribution in the
 * LICENSE.txt file.
 */
package com.sitewhere.rest.model.tenant.request.scripting;

import com.sitewhere.rest.model.tenant.request.TenantCreateRequest;
import com.sitewhere.spi.SiteWhereException;
import com.sitewhere.spi.tenant.ITenant;
import com.sitewhere.spi.tenant.ITenantManagement;

/**
 * Builder that supports creating tenant management entities.
 * 
 * @author Derek
 */
public class TenantManagementRequestBuilder {

    /** Template that does not load any device data */
    private static final String EMPTY_TEMPLATE_NAME = "empty";

    /** Device management implementation */
    private ITenantManagement tenantManagement;

    public TenantManagementRequestBuilder(ITenantManagement tenantManagement) {
	this.tenantManagement = tenantManagement;
    }

    /**
     * Create builder for new tenant request. Assumes tenant uses the "empty" tenant
     * template.
     * 
     * @param id
     * @param name
     * @param authenticationToken
     * @param logoUrl
     * @return
     */
    public TenantCreateRequest.Builder newTenant(String id, String name, String authenticationToken, String logoUrl) {
	return newTenant(id, name, authenticationToken, logoUrl, EMPTY_TEMPLATE_NAME);
    }

    /**
     * Create builder for new tenant request. Allows tenant template to be
     * specified.
     * 
     * @param id
     * @param token
     * @param authenticationToken
     * @param logoUrl
     * @param tenantTemplateId
     * @return
     */
    public TenantCreateRequest.Builder newTenant(String token, String name, String authenticationToken, String logoUrl,
	    String tenantTemplateId) {
	return new TenantCreateRequest.Builder(token, name, authenticationToken, logoUrl, tenantTemplateId);
    }

    /**
     * Persist tenant contructed via builder.
     * 
     * @param builder
     * @return
     * @throws SiteWhereException
     */
    public ITenant persist(TenantCreateRequest.Builder builder) throws SiteWhereException {
	return getTenantManagement().createTenant(builder.build());
    }

    /**
     * Get tenant by token.
     * 
     * @param token
     * @return
     * @throws SiteWhereException
     */
    public ITenant getTenantByToken(String token) throws SiteWhereException {
	return getTenantManagement().getTenantByToken(token);
    }

    /**
     * Indicates whether a tenant exists for the given token.
     * 
     * @param id
     * @return
     * @throws SiteWhereException
     */
    public boolean hasTenant(String token) throws SiteWhereException {
	return getTenantByToken(token) != null;
    }

    public ITenantManagement getTenantManagement() {
	return tenantManagement;
    }

    public void setTenantManagement(ITenantManagement tenantManagement) {
	this.tenantManagement = tenantManagement;
    }
}