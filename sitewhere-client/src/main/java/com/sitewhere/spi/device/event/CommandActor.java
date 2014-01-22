/*
 * CommandActor.java 
 * --------------------------------------------------------------------------------------
 * Copyright (c) Reveal Technologies, LLC. All rights reserved. http://www.reveal-tech.com
 *
 * The software in this package is published under the terms of the CPAL v1.0
 * license, a copy of which has been included with this distribution in the
 * LICENSE.txt file.
 */
package com.sitewhere.spi.device.event;

/**
 * Enumerates types of actors that may participate in commands.
 * 
 * @author Derek
 */
public enum CommandActor {

	/** Actor is a REST service call */
	RestCall,

	/** Actor is a physical device */
	Device,

	/** Actor is the system */
	System;
}