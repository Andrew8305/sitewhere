/*
 * Copyright (c) SiteWhere, LLC. All rights reserved. http://www.sitewhere.com
 *
 * The software in this package is published under the terms of the CPAL v1.0
 * license, a copy of which has been included with this distribution in the
 * LICENSE.txt file.
 */
package com.sitewhere.device;

import java.util.UUID;

import com.sitewhere.rest.model.device.event.request.DeviceStateChangeCreateRequest;
import com.sitewhere.spi.SiteWhereException;
import com.sitewhere.spi.device.IDeviceAssignment;
import com.sitewhere.spi.device.IDeviceManagement;
import com.sitewhere.spi.device.event.IDeviceEventManagement;
import com.sitewhere.spi.device.event.request.IDeviceStateChangeCreateRequest;
import com.sitewhere.spi.device.request.IDeviceAssignmentCreateRequest;

/**
 * Adds triggers for processing related to device management API calls.
 * 
 * @author Derek
 */
public class DeviceManagementTriggers extends DeviceManagementDecorator {

    /** Device event management */
    private IDeviceEventManagement deviceEventManangement;

    public DeviceManagementTriggers(IDeviceManagement delegate, IDeviceEventManagement deviceEventManangement) {
	super(delegate);
	this.deviceEventManangement = deviceEventManangement;
    }

    /*
     * (non-Javadoc)
     * 
     * @see
     * com.sitewhere.device.DeviceManagementDecorator#createDeviceAssignment(com
     * .sitewhere .spi.device.request.IDeviceAssignmentCreateRequest)
     */
    @Override
    public IDeviceAssignment createDeviceAssignment(IDeviceAssignmentCreateRequest request) throws SiteWhereException {
	IDeviceAssignment created = super.createDeviceAssignment(request);
	DeviceStateChangeCreateRequest state = new DeviceStateChangeCreateRequest();
	state.setCategory(IDeviceStateChangeCreateRequest.CATEGORY_ASSIGNMENT);
	state.setType("create");
	getDeviceEventManangement().addDeviceStateChange(created.getId(), state);
	return created;
    }

    /*
     * @see
     * com.sitewhere.device.DeviceManagementDecorator#updateDeviceAssignment(java.
     * util.UUID, com.sitewhere.spi.device.request.IDeviceAssignmentCreateRequest)
     */
    @Override
    public IDeviceAssignment updateDeviceAssignment(UUID id, IDeviceAssignmentCreateRequest request)
	    throws SiteWhereException {
	IDeviceAssignment updated = super.updateDeviceAssignment(id, request);
	DeviceStateChangeCreateRequest state = new DeviceStateChangeCreateRequest();
	state.setCategory(IDeviceStateChangeCreateRequest.CATEGORY_ASSIGNMENT);
	state.setType("update");
	getDeviceEventManangement().addDeviceStateChange(updated.getId(), state);
	return updated;
    }

    /*
     * @see
     * com.sitewhere.device.DeviceManagementDecorator#endDeviceAssignment(java.util.
     * UUID)
     */
    @Override
    public IDeviceAssignment endDeviceAssignment(UUID id) throws SiteWhereException {
	IDeviceAssignment updated = super.endDeviceAssignment(id);
	DeviceStateChangeCreateRequest state = new DeviceStateChangeCreateRequest();
	state.setCategory(IDeviceStateChangeCreateRequest.CATEGORY_ASSIGNMENT);
	state.setType("end");
	getDeviceEventManangement().addDeviceStateChange(updated.getId(), state);
	return updated;
    }

    public IDeviceEventManagement getDeviceEventManangement() {
	return deviceEventManangement;
    }

    public void setDeviceEventManangement(IDeviceEventManagement deviceEventManangement) {
	this.deviceEventManangement = deviceEventManangement;
    }
}