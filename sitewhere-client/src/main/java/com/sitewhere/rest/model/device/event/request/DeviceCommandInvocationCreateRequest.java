/*
 * DeviceCommandInvocationCreateRequest.java 
 * --------------------------------------------------------------------------------------
 * Copyright (c) Reveal Technologies, LLC. All rights reserved. http://www.reveal-tech.com
 *
 * The software in this package is published under the terms of the CPAL v1.0
 * license, a copy of which has been included with this distribution in the
 * LICENSE.txt file.
 */
package com.sitewhere.rest.model.device.event.request;

import java.util.HashMap;
import java.util.Map;

import com.sitewhere.rest.model.device.event.DeviceCommandInvocation;
import com.sitewhere.spi.device.event.CommandActor;
import com.sitewhere.spi.device.event.CommandStatus;
import com.sitewhere.spi.device.event.request.IDeviceCommandInvocationCreateRequest;

/**
 * Model object used to create a new {@link DeviceCommandInvocation} via REST APIs.
 * 
 * @author Derek
 */
public class DeviceCommandInvocationCreateRequest extends DeviceEventCreateRequest implements
		IDeviceCommandInvocationCreateRequest {

	/** Type of actor that issued the command */
	private CommandActor sourceActor;

	/** Id of actor that issued the command */
	private String sourceId;

	/** Type of actor that will receive the command */
	private CommandActor targetActor;

	/** Id of actor that will receive the command */
	private String targetId;

	/** Token of command to be invoked */
	private String commandToken;

	/** Values to use for command parameters */
	private Map<String, String> parameterValues = new HashMap<String, String>();

	/** Current invocation status */
	private CommandStatus status;

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.sitewhere.spi.device.event.request.IDeviceCommandInvocationCreateRequest#
	 * getSourceActor()
	 */
	public CommandActor getSourceActor() {
		return sourceActor;
	}

	public void setSourceActor(CommandActor sourceActor) {
		this.sourceActor = sourceActor;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.sitewhere.spi.device.event.request.IDeviceCommandInvocationCreateRequest#
	 * getSourceId()
	 */
	public String getSourceId() {
		return sourceId;
	}

	public void setSourceId(String sourceId) {
		this.sourceId = sourceId;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.sitewhere.spi.device.event.request.IDeviceCommandInvocationCreateRequest#
	 * getTargetActor()
	 */
	public CommandActor getTargetActor() {
		return targetActor;
	}

	public void setTargetActor(CommandActor targetActor) {
		this.targetActor = targetActor;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.sitewhere.spi.device.event.request.IDeviceCommandInvocationCreateRequest#
	 * getTargetId()
	 */
	public String getTargetId() {
		return targetId;
	}

	public void setTargetId(String targetId) {
		this.targetId = targetId;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.sitewhere.spi.device.event.request.IDeviceCommandInvocationCreateRequest#
	 * getCommandToken()
	 */
	public String getCommandToken() {
		return commandToken;
	}

	public void setCommandToken(String commandToken) {
		this.commandToken = commandToken;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.sitewhere.spi.device.event.request.IDeviceCommandInvocationCreateRequest#
	 * getParameterValues()
	 */
	public Map<String, String> getParameterValues() {
		return parameterValues;
	}

	public void setParameterValues(Map<String, String> parameterValues) {
		this.parameterValues = parameterValues;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.sitewhere.spi.device.event.request.IDeviceCommandInvocationCreateRequest#getStatus
	 * ()
	 */
	public CommandStatus getStatus() {
		return status;
	}

	public void setStatus(CommandStatus status) {
		this.status = status;
	}
}