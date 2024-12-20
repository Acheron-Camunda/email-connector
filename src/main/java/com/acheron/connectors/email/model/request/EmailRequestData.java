package com.acheron.connectors.email.model.request;

import com.acheron.connectors.email.model.response.EmailResponse;

/**
 * Interface defining the structure for email request data objects.
 * This interface ensures that all implementing classes provide an implementation
 * for executing the email operation and returning a response.
 * 
 * @author HariharanB
 */
public interface EmailRequestData {
	 /**
     * Executes the email operation specific to the implementing class.
     *
     * @return an {@link EmailResponse} object encapsulating the result of the operation
     */
	EmailResponse invokeCut();
}